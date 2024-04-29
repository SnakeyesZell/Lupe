import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/domain/domain.dart';

part 'auth_state.dart';

class AuthProvider extends ChangeNotifier 
{
  late AuthState _state;
  late IAuthRepository repository;

  AuthProvider(this.repository) 
  {
    this._state = AuthState();
    this._loadLocalLupeUser();
  }

  AuthState get state => this._state;

  Future<void> signIn(AuthMethod authMethod) async 
  {
    try 
    {      
      LupeUser lupeUser = await this.repository.signIn(authMethod);
      this._state = this._state.copyWith(lupeUser: lupeUser);
      notifyListeners();    

      await AuthSecureStorage.writeData(
        key: AuthSecureStorage.lupeUser, 
        value: json.encode(lupeUser.toJson()),
      );
    } 
    catch (e) 
    {
      throw Exception(e);
    }
  }

  String getUserName() 
  {
    String name = '';

    if(this._state.lupeUser != null) 
    {
      List<String> splitedName = this._state.lupeUser!.name.split(' ');      
      name = splitedName.first;
    }

    return name;
  }

  Future<void> _loadLocalLupeUser() async 
  {
    String lupeUserJson = await AuthSecureStorage.readData(AuthSecureStorage.lupeUser);
    
    if(lupeUserJson.isNotEmpty) 
    {
      LupeUser lupeUser = LupeUser.fromJson(json.decode(lupeUserJson));
      this._state = this._state.copyWith(lupeUser: lupeUser);
      notifyListeners();
    }
  }
}


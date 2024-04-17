import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';

part 'auth_state.dart';

class AuthProvider extends ChangeNotifier 
{
  late AuthState _state;
  late IAuthRepository repository;

  AuthProvider(this.repository): this._state = AuthState();

  AuthState get state => this._state;

  Future<void> signIn(AuthMethod authMethod) async 
  {
    try 
    {      
      LupeUser lupeUser = await this.repository.signIn(authMethod);
      this._state = this._state.copyWith(lupeUser: lupeUser);
      notifyListeners();    
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
}


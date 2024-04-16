import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';

part 'auth_state.dart';

class AuthProvider extends ChangeNotifier 
{
  late AuthState _state;
  late IAuthRepository repository;

  AuthProvider(this.repository): this._state = AuthState();

  AuthState get state => this._state;

  Future<void> signIn() async 
  {
    try 
    {      
      LupeUser lupeUser = await this.repository.signIn();
      this._state = this._state.copyWith(lupeUser: lupeUser);
      notifyListeners();    
    } 
    catch (e) 
    {
      throw Exception(e);
    }
  }
}


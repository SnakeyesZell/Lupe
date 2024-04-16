import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lupe/domain/domain.dart';

class AuthRepository extends IAuthRepository 
{
  final IAuthDataSource dataSource;

  AuthRepository(this.dataSource);

  @override
  User? getFirebaseUser()=> this.dataSource.getCurrenFirebasetUser();

  @override
  Future<LupeUser> signIn() async
  {
    if(Platform.isAndroid) return this.dataSource.signInWithGoogle();
    else return this.dataSource.signInWithApple();
  }
  
}

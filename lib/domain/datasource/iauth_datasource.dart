import 'package:firebase_auth/firebase_auth.dart';

import 'package:lupe/domain/domain.dart';

abstract class IAuthDataSource
{
  User? getCurrenFirebasetUser();
  Future<LupeUser> signInWithGoogle();
  Future<LupeUser> signInWithApple();
}
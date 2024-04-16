import 'package:firebase_auth/firebase_auth.dart';

import 'package:lupe/domain/domain.dart';

abstract class IAuthRepository 
{
  Future<LupeUser> signIn();
  User? getFirebaseUser();
}
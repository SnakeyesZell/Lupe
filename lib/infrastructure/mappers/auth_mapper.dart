import 'package:firebase_auth/firebase_auth.dart';

import 'package:lupe/domain/domain.dart';

abstract class AuthMapper 
{
  static LupeUser getUserFromGoogle(User? firebaseUser)=> LupeUser(
    imageUrl : firebaseUser?.photoURL ?? '',
    email    : firebaseUser?.email ?? '', 
    name     : firebaseUser?.displayName ?? '', 
    id       : firebaseUser?.uid ?? '',
  );  
}


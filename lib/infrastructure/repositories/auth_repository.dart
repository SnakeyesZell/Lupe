import 'package:firebase_auth/firebase_auth.dart';

import 'package:lupe/domain/domain.dart';

class AuthRepository extends IAuthRepository 
{
  final IAuthDataSource dataSource;

  AuthRepository(this.dataSource);

  @override
  User? getFirebaseUser()=> this.dataSource.getCurrenFirebasetUser();

  @override
  Future<LupeUser> signIn(AuthMethod authMethod) async
  {
    return (authMethod == AuthMethod.google) 
    ? this.dataSource.signInWithGoogle()
    : this.dataSource.signInWithApple();
  }  
}

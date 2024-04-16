import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

class AuthDataSource extends IAuthDataSource
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  User? getCurrenFirebasetUser()=> this._auth.currentUser;

  @override
  Future<LupeUser> signInWithGoogle() async 
  {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential userCredential = await this._auth.signInWithCredential(authCredential);
    User? userData = userCredential.user;

    return AuthMapper.getUserFromGoogle(userData);    
  }
  
  @override
  Future<LupeUser> signInWithApple() 
  {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }
}



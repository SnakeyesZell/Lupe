import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

class AuthDataSource implements IAuthDataSource
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  User? getCurrenFirebasetUser()=> this._auth.currentUser;

  @override
  Future<LupeUser> signInWithGoogle() async 
  {
    try 
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

      LupeUser lupeUser = AuthMapper.getUserFromGoogle(userData);
      this._createFirebaseLuperUser(lupeUser.toJson());

      return lupeUser;
    } 
    on FirebaseAuthException catch(e) 
    {      
      throw Exception('Error with Google SignIn: $e');
    }
    catch (e) 
    {
      throw Exception('Something failed with Google SignIn');
    }

  }
  
  @override
  Future<LupeUser> signInWithApple() 
  {
    try 
    {      
      // TODO: implement signInWithApple
      throw UnimplementedError();
    } 
    catch (e) 
    {
      throw Exception('Something failed with Apple SignIn');
    }
  }

  Future<void> _createFirebaseLuperUser(Map<String, dynamic> data) async 
  {
    CollectionReference lupeUsersReference = FirebaseFirestore.instance.collection("lupeUsers");

    try 
    {
      await FirebaseFirestore.instance.runTransaction((Transaction transaction) async 
      {
        Query query = lupeUsersReference.where('email', isEqualTo: data['email']);

        (query.parameters.isEmpty) 
        ? await FirebaseFirestore.instance.collection("lupeUsers").doc().set(data)
        : null;        
      });
    } 
    catch (e) 
    {
      throw Exception('Error creating user on Firestore');
    }
  }
}



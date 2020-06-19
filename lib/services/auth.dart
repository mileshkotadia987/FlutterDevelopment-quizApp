import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizzler/models/user.dart';

class AuthService{
  FirebaseAuth _auth=FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user!=null ? User(uid: user.uid) : null;
  }

  Future signInEmailPassword(String email,String password)async{
    try{
      AuthResult authResult=await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user=authResult.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future signUpEmailPassword(String email,String password)async{
    try{
      AuthResult authResult=await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user=authResult.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
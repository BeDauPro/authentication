import 'package:authenticationapp/pages/myprofile.dart';
import 'package:authenticationapp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutheMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  getCurrentUser() async{
    return await auth.currentUser;
  }
  SigninWithGoogle(BuildContext context)async{
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetail = result.user;

    if (userDetail != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetail.email,
        "name": userDetail.displayName,
        "imgUrl": userDetail.photoURL,
        "id": userDetail.uid
      };
      await DatabaseMethods().addUser(userDetail.uid, userInfoMap).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofile()));
      });
    } else {
      print("User details are null");
    }
  }
}
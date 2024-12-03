import 'dart:developer';
import 'package:authenticationapp/pages/myprofile.dart';
import 'package:authenticationapp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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


class SignInMethods {
  static Future<UserCredential> signInWithFacebook(Map<String, dynamic> userData) async {
    await FacebookAuth.instance.logOut();

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    log(loginResult.accessToken!.tokenString.toString());
    log(loginResult.message.toString());

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    log(userCredential.additionalUserInfo!.username.toString());
    log(userCredential.user!.email.toString());
    log(userCredential.user!.photoURL.toString());
    return userCredential;
  }

  // Future<void> signInWithTwitter(BuildContext context) async {
  //   final twitterLogin = TwitterLogin(
  //     apiKey: 'XI1ujpaIjozQjkXOnujpYfKF2',  // Thay thế bằng API key của bạn
  //     apiSecretKey: 'JbelPzhgBclVtc80Yx1zWe7R3mOda598VIQhclFwMRXIndbZCy',  // Thay thế bằng API secret key của bạn
  //     redirectURI: 'socialauth://',
  //   );
  //
  //   final authResult = await twitterLogin.login();
  //
  //   if (authResult.status == TwitterLoginStatus.loggedIn) {
  //     try {
  //       final credential = TwitterAuthProvider.credential(
  //         accessToken: authResult.authToken!,
  //         secret: authResult.authTokenSecret!,
  //       );
  //
  //       // Đăng nhập vào Firebase với credential từ Twitter
  //       UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //       final userDetails = authResult.user;
  //       log('User name: ${userDetails!.name}');
  //       log('User email: ${userCredential.user?.email}');
  //       log('User photo URL: ${userDetails.thumbnailImage}');
  //
  //       // Lưu thông tin người dùng vào Firestore hoặc Realtime Database
  //       Map<String, dynamic> userInfoMap = {
  //         "email": userCredential.user?.email,
  //         "name": userDetails.name,
  //         "imgUrl": userDetails.thumbnailImage,
  //         "id": userCredential.user?.uid,
  //       };
  //
  //       await DatabaseMethods().addUser(userCredential.user!.uid, userInfoMap).then((value) {
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofile()));
  //       });
  //
  //     } on FirebaseAuthException catch (e) {
  //       // Xử lý các lỗi FirebaseAuthException
  //       switch (e.code) {
  //         case "account-exists-with-different-credential":
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tài khoản đã tồn tại với một nhà cung cấp khác.')));
  //           break;
  //         case "null":
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Có lỗi không mong muốn khi cố gắng đăng nhập.')));
  //           break;
  //         default:
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: ${e.message}')));
  //       }
  //     }
  //   } else {
  //     // Nếu đăng nhập không thành công
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đăng nhập Twitter thất bại')));
  //   }
  // }
}

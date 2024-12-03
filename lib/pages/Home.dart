import 'dart:developer';
import 'package:authenticationapp/pages/myprofile.dart';
import 'package:authenticationapp/pages/signin.dart';
import 'package:authenticationapp/pages/signup.dart';
import 'package:authenticationapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'profile',
  ],
  signInOption: SignInOption.standard,
  forceCodeForRefreshToken: true, // Buộc chọn tài khoản mới khi đăng nhập.
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9dc3d5),
              Color(0xFF9ac3d4),
              Color.fromARGB(145, 27, 94, 118),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DUC'S PROFILE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 120.0),
            const Text(
              "WELCOME TO MY APP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Center(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80.0),
            const Text(
              "Login with social media",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await _googleSignIn.signIn().then((user) {
                      if (user != null) {
                        AutheMethods().SigninWithGoogle(context);
                      }
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đăng nhập thất bại: $error')),
                      );
                    });
                  },
                  child: Image.asset(
                    "images/img.png",
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () async {
                    try {

                      final loginResult = await FacebookAuth.instance.login(permissions: ['email']);

                      if (loginResult.status == LoginStatus.success) {

                        final userData = await FacebookAuth.instance.getUserData();

                        SignInMethods.signInWithFacebook(userData);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Myprofile())
                        );
                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Đăng nhập Facebook thất bại: ${loginResult.message}')),
                        );
                      }
                    } catch (error) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lỗi: $error')),
                      );
                    }
                  },
                  child: Image.asset(
                    "images/img_1.png",
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap:
                  () async {

                  },
                  child: Image.asset(
                    "images/img_2.png",
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


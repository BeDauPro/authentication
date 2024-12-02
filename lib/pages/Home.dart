import 'package:authenticationapp/pages/signin.dart';
import 'package:authenticationapp/pages/signup.dart';
import 'package:authenticationapp/service/auth.dart';
import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF9dc3d5),
            Color(0xFF9ac3d4),
            Color.fromARGB(145, 27, 94, 118)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DUC'S PROFILE", style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 120.0,),
            Text("WELCOME TO MY APP", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w500),),
            SizedBox(height: 50.0,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
              },
              child: Container(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
            ),
            SizedBox(height: 80.0,),
            Text(
              "Login with social media",
              style: TextStyle(color: Colors.white, fontSize: 20.0,),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    AutheMethods().SigninWithGoogle(context);
                  },
                    child: Image.asset("images/img.png", width: 40.0, height: 40.0, fit: BoxFit.cover,)),
                SizedBox(width: 20.0,),
                Image.asset("images/img_1.png", width: 40.0, height: 40.0,fit: BoxFit.cover),
                SizedBox(width: 20.0,),
                Image.asset("images/img_2.png", width: 40.0, height: 40.0,fit: BoxFit.cover),
              ],
            )
          ],
        )
      ),
    );
  }
}

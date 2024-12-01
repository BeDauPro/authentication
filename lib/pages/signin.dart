import 'package:authenticationapp/pages/forgot_password.dart';
import 'package:authenticationapp/pages/myprofile.dart';
import 'package:authenticationapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email = "", password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  userLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Myprofile()));
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email", style: TextStyle(color: Colors.red),),));
      } else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for that user", style: TextStyle(color: Colors.red),),));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff0d42f8),
          Color(0xff1f28a6),
          Color.fromARGB(145, 0, 83, 255)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text("Hello\nSign In!", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 40.0,),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50.0, left: 30, right: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style: TextStyle(color:Color(0xff0d42f8), fontSize: 23.0, fontWeight: FontWeight.bold),),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(hintText: "Enter your email",
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),
                      SizedBox(height: 40.0,),
                      Text("Password", style: TextStyle(color:Color(0xff0d42f8), fontSize: 23.0, fontWeight: FontWeight.bold),),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(hintText: "Enter your password",
                            prefixIcon: Icon(Icons.lock_outlined)),
                      ),
                      SizedBox(height: 20.0,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot Password ?", style: TextStyle(color:Color(0xff0d42f8), fontSize: 18.0, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      SizedBox(height: 80.0,),
                      GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xff0d42f8),
                              Color(0xff1f28a6),
                              Color.fromARGB(145, 0, 83, 255)
                            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child:Center(
                              child:
                              Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Don't have an account ?", style: TextStyle(color:Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                                  },
                                  child: Text("SIGN UP", style: TextStyle(color: Color(0xff0d42f8), fontSize: 22.0, fontWeight: FontWeight.bold),)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

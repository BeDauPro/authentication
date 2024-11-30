import 'package:authenticationapp/pages/signin.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

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
                  child: Text("Create your\nAccount!", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 40.0,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 50.0, left: 30, right: 30.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name", style: TextStyle(color:Color(0xff0d42f8), fontSize: 23.0, fontWeight: FontWeight.bold),),
                        TextField(decoration: InputDecoration(hintText: "Enter your name", prefixIcon: Icon(Icons.person_outlined)),
                        ),
                        SizedBox(height: 40.0,),
                        Text("Email", style: TextStyle(color:Color(0xff0d42f8), fontSize: 23.0, fontWeight: FontWeight.bold),),
                        TextField(decoration: InputDecoration(hintText: "Enter your email", prefixIcon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(height: 40.0,),
                        Text("Password", style: TextStyle(color:Color(0xff0d42f8), fontSize: 23.0, fontWeight: FontWeight.bold),),
                        TextField(decoration: InputDecoration(hintText: "Enter your password", prefixIcon: Icon(Icons.lock_outlined)),
                        ),
                        SizedBox(height: 20.0,),

                        SizedBox(height: 40.0,),
                        Container(
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
                            Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Already have an account ?", style: TextStyle(color:Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                                    },
                                    child: Text("SIGN IN", style: TextStyle(color: Color(0xff0d42f8), fontSize: 22.0, fontWeight: FontWeight.bold),)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
}

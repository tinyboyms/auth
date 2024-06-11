import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firbase/components/logo.dart';
import 'package:firbase/components/MyTextField.dart';
import 'package:firbase/components/signinbtn.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  //text editing controller
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();





  //sign in user method
  void sign() async {
    showDialog(context: context,
      builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernamecontroller.text,
          password: passwordcontroller.text);
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      //here check the id and pass if.. elseif....
      showErrorMessage(e.code);
    }

  }
//Invalid Credential Message Show
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
             title: Text(message),);

          //content: Text("Do You Want To Try Again!"),
          // actions: [
          //   CupertinoDialogAction(
          //     child: Text('Yes'),
          //     onPressed: () => Navigator.of(context).pop(true),
          //   ),
          //   CupertinoDialogAction(
          //     child: Text('No'),
          //     onPressed: () => Navigator.of(context).pop(SystemNavigator.pop()),
          //   ),
          // ],
      },
    );

  }



//methods worngEmail and WrongPassword
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        // child: Padding( padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //icon
                SizedBox(
                  height: 80,
                ),
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                // wellcome text
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Wellcome Back You've been missed!",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

                SizedBox(
                  height: 30,
                ),

                //username
                MyTextField(
                  controller: usernamecontroller,
                  htext: "Usernmae",
                  obtext: false,
                ),

                SizedBox(
                  height: 10,
                ),

                //passsword
                MyTextField(
                  controller: passwordcontroller,
                  htext: "Password",
                  obtext: true,
                ),

                SizedBox(height: 10),

                //forget password
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade500)),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                //signin button
                SignInButton(
                  text: "Sign In",
                  onTap: sign,
                ),

                SizedBox(
                  height: 50,
                ),

                //text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                        height: 5,
                      )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Continue With",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),

                // logo button
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imgpath: 'assets/images/google.png'),
                    SizedBox(width: 25),
                    SquareTile(imgpath: 'assets/images/apple.png'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                //text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

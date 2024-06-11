import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user= FirebaseAuth.instance.currentUser!;

  //sign out method
  void signUserOut()
   {
    FirebaseAuth.instance.signOut();
   }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading:Center(child: Text("😃 "+user.email!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white))),
          leadingWidth: 150,
          actions: [
            IconButton(onPressed: signUserOut,
              icon: Icon(Icons.login_outlined),color: Colors.white,
            )
          ]
      ),

      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 280,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png'),
                  fit: BoxFit.cover,
                )
            ),
          )
      ),
    );
  }
}




import 'package:firbase/Pages/Login_page.dart';
import 'package:flutter/material.dart';

class Register_Page extends StatefulWidget {
  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  //init show log
  bool showloginpage = true;

  //toggle between login and register
  void togglepage() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (showloginpage) {
      return LoginPage(onTap: togglepage,);
    } else {
     return Register_Page();
    }
  }
}

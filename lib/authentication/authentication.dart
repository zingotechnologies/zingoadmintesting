import 'package:flutter/material.dart';

import 'register.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showCheck = true;

  void toggleView(){
    setState(() {
      showCheck = !showCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showCheck){
      /*return SignIn(toggleView: toggleView);*/
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

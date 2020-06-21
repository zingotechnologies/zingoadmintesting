import 'package:flutter/material.dart';
import 'package:zingoadmin/pages/signUpPage.dart';

import 'package:zingoadmin/ui/placeholderWidgets/welcome.dart';
import 'googleButton.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Key key;

  String _userName;
  String _userPassword;
  String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff435480),
        child: _content(),
      ),
    );
  }

  Widget _username(){
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      height: 30.0,
      width: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xff6a84c8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 5
            )
          ]
      ),
      child: Center(
        child: TextFormField(
          key: key,
          cursorColor: Color(0xffaeadaa),
          style: TextStyle(color: Colors.white),
          autocorrect: false,
          decoration: InputDecoration(
              hintText: "Email/Username",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none
          ),
          onFieldSubmitted: (text){
            print(text);
            _userName = text;
          },
          onSaved: (text){
            _userName = text;
          },
        ),
      ),
    );
  }

  bool _passwordDisplay(){
    return true;
  }

  Widget _password(){
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      height: 30.0,
      width: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xff6a84c8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 5
            )
          ]
      ),
      child: Center(
        child: TextFormField(
          key: key,
          cursorColor: Color(0xffaeadaa),
          style: TextStyle(color: Colors.white),
          autocorrect: false,
          obscureText: _passwordDisplay(),
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
          ),
          onFieldSubmitted: (text){
            print(text);
            _userPassword = text;
          },
          onSaved: (text){
            _userPassword = text;
          },
        ),
      ),
    );
  }

  Widget _signInButton(){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/dashboard');
      },
      child: Container(
        height: 30.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Color(0xff6276a8),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 10.0
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SIGN IN", style: TextStyle(color: Colors.white)),
            SizedBox(width: 10.0),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15.0)
          ],
        ),
      ),
    );
  }

  Widget _content(){
    return Stack(
      children: <Widget>[

        Column(
          children: <Widget>[
            Spacer(),

            SizedBox(height: 20.0),

            Center(
              child: _username(),
            ),

            SizedBox(height: 20.0),

            // Username text field
            Center(
              child: _password(),
            ),

            SizedBox(height: 20.0),

            // SignIn Button
            _signInButton(),


            SizedBox(height: 20.0),

            // Forgot password function
            GestureDetector(
              onTap: (){

              },
              child: Center(
                child: Text("Forgot Password?", style: TextStyle(color: Colors.white70, fontSize: 14.0)),
              ),
            ),


            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(color: Colors.white),
            ),


            Center(
                child: Text("OR", style: TextStyle(color: Colors.white, fontSize: 16.0))
            ),


            SizedBox(height: 30.0),

            // Google Login function
            Google(),


            SizedBox(height: 50.0),

            // Sign Up function
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                SizedBox(width: 10.0),
                GestureDetector(
                  child: Text("Sign Up", style: TextStyle(color: Colors.red, fontSize: 16.0)),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                )
              ],
            ),


            SizedBox(height: 20.0)
          ],
        ),
        Positioned(
          top: 30.0,
          left: 10.0,
          child: IconButton(
            color: Colors.transparent,
            icon: Icon(Icons.clear, color: Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  bool obscureTextCheck = true;
  
  Widget _buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: TextStyle()),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: "Email/Username",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6))
            ),
          ),
        )
      ],
    );
  }

  Widget _setPasswordIcon(bool check){
    if(check != true){
      return Icon(Icons.do_not_disturb_alt, color: Colors.white);
    }

    return Icon(Icons.face, color: Colors.white);
  }

  bool _obscureTextCheck(bool check){
    if(check != true){
      return false;
    }
    return true;
  }

  Widget _buildPasswordTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Passwoord", style: TextStyle()),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: _obscureTextCheck(obscureTextCheck),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                suffixIcon: IconButton(
                  icon: _setPasswordIcon(obscureTextCheck),
                  onPressed: (){
                    setState(() {
                      obscureTextCheck = !obscureTextCheck;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6))
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColourSys.secondary,
                  ColourSys.primary,
                  ColourSys.secondaryDark,
                  ColourSys.secondaryLight
                ],
                stops: [0.1, 0.4, 0.7, 0.8]
              )
            )
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30.0),
                    _buildEmailTF(),
                    SizedBox(height: 30.0),
                    _buildPasswordTF()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


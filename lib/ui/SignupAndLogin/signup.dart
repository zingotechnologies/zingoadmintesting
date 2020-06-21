import 'package:flutter/material.dart';
import 'package:zingoadmin/services/authentication.dart';
import 'package:zingoadmin/ui/drawerWidgets/globalDrawer.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff435480),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.transparent,
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _buildBody(),
    );
  }

  bool agreed = false;

  Widget _agreement(bool check){
    Widget innerContainer;

    if(check == true){
      innerContainer = Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightBlueAccent
      );
    } else {
      innerContainer = Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff435480)
      );
    }

    return innerContainer;
  }

  Widget _buildBody(){

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 25.0)),
            ),
            SizedBox(height: 50.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(
                          child: TextFormField(
                            key: widget.key,
                            cursorColor: Color(0xffaeadaa),
                            style: TextStyle(color: Colors.white),
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintText: "FIRST NAME *",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            onFieldSubmitted: (text){

                            },
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(
                          child: TextFormField(
                            cursorColor: Color(0xffaeadaa),
                            style: TextStyle(color: Colors.white),
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintText: "LAST NAME *",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            onFieldSubmitted: (text){

                            },
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      cursorColor: Color(0xffaeadaa),
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: "COMPANY NAME",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      onFieldSubmitted: (text){

                      },
                    ),
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      key: widget.key,
                      cursorColor: Color(0xffaeadaa),
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: "EMAIL ADDRESS *",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      onFieldSubmitted: (text){

                      },
                      onSaved: (text){

                      },
                    ),
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(
                          child: TextFormField(
                            key: widget.key,
                            cursorColor: Color(0xffaeadaa),
                            style: TextStyle(color: Colors.white),
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintText: "BIRTHDATE",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            onFieldSubmitted: (text){

                            },
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)
                        ),
                        child: Center(
                          child: TextFormField(
                            key: widget.key,
                            cursorColor: Color(0xffaeadaa),
                            style: TextStyle(color: Colors.white),
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintText: "GENDER",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            onFieldSubmitted: (text){

                            },
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      key: widget.key,
                      cursorColor: Color(0xffaeadaa),
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: "USERNAME",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      onFieldSubmitted: (text){

                      },
                    ),
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      key: widget.key,
                      cursorColor: Color(0xffaeadaa),
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "PASSWORD",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      onSaved: (text){

                      },
                      onFieldSubmitted: (text){

                      },
                    ),
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      key: widget.key,
                      cursorColor: Color(0xffaeadaa),
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "CONFIRM PASSWORD",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      onFieldSubmitted: (text){

                      },
                    ),
                  )
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      agreed = !agreed;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    height: 18.0,
                    width: 18.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: _agreement(agreed)
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(onTap: (){

                },
                    child: Text("AGREE TO TERMS AND CONDITIONS",
                        style: TextStyle(color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationStyle: TextDecorationStyle.solid)
                    )
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Spacer(),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 30.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: Color(0xff6276a8),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 10),
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Continue", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10.0),
                          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.0)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0)
              ],
            )
          ],
        ),
      ),
    );
  }

}

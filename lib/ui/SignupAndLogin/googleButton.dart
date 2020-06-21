import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Google extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: _button(),
      ),
    );
  }

  Widget _button(){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: double.infinity,
        width: 100.0,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 10),
              blurRadius: 10.0
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.face, color: Colors.white),
              SizedBox(width: 10.0),
              Text("Google", style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

}

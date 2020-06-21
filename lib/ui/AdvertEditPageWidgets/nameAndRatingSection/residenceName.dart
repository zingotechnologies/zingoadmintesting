import 'package:flutter/material.dart';

Widget buildName(BuildContext context){

  Key key;

  //Residence residence = Residence();

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
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
                    hintText: "NAME",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
                onFieldSubmitted: (text){
                  //residence.residenceName = text;
                },
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            height: 30.0,
            width: MediaQuery.of(context).size.width - 50.0,
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
                autocorrect: false,
                onFieldSubmitted: (text){
                  //residence.shortDescription = text;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "SHORT DESCRIPTION",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),

              ),
            ),
          ),
        ],
      )
  );

}
import 'package:flutter/material.dart';

Widget rating(){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 5),
                    blurRadius: 5
                )
              ]
          ),
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Color(0xff6a84c8),
          ),
        ),
        SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Number of stars with the rating number and verdict
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                        SizedBox(width: 5.0),
                        Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                        SizedBox(width: 5.0),
                        Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                        SizedBox(width: 5.0),
                        Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                        SizedBox(width: 5.0),
                        Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                        SizedBox(width: 10.0),
                        Container(
                          height: 20.0,
                          width: 30.0,
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
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          height: 20.0,
                          width: 60.0,
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
                        ),
                      ],
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      height: 20.0,
                      width: 100.0,
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
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 5.0),
            Container(
              height: 20.0,
              width: 100.0,
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
            ),
          ],
        )
      ],
    ),
  );
}
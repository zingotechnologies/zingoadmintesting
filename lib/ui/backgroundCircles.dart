import 'package:flutter/material.dart';


Widget backgroundCircles(){
  return Positioned(
    top: 0,
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
        color: Color(0xff435480),
        child: LayoutBuilder(
          builder: (context, constraint){
            // final height = constraint.maxHeight;
            final width = constraint.maxWidth;
            return Stack(
              children: <Widget>[
                Positioned(
                  left: width * 0.15,
                  top: -width * 0.5,
                  child: Container(
                    height: width * 1.6,
                    width: width * 1.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff4d6194),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 20),
                              blurRadius: 20
                          )
                        ]
                    ),
                  ),
                ),
                Positioned(
                  right: -width * 0.2,
                  top: -50.0,
                  child: Container(
                    height: width * 0.6,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff6276a8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 20),
                              blurRadius: 20
                          )
                        ]
                    ),
                  ),
                )
              ],
            );
          },
        )
    ),
  );
}
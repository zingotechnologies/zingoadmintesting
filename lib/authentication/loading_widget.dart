import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff398ae5).withOpacity(0.8),
      child: Center(
          child: SpinKitChasingDots(
              color: Color(0xff398ae5),
              size: 50.0
          )
      ),
    );
  }
}
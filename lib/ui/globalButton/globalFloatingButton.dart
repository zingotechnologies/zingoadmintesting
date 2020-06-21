import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlobalFloatingButton extends StatefulWidget {

  double elevation;

  Color colour = Color(0xff6276a8);

  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  GlobalFloatingButton({
    this.colour,
    @required this.drawerKey,
    this.elevation =  8.5
  });

  @override
  _GlobalFloatingButtonState createState() => _GlobalFloatingButtonState();
}

class _GlobalFloatingButtonState extends State<GlobalFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        widget.drawerKey.currentState.openDrawer();
      },
      child: Icon(Icons.menu, color: Colors.white),
      backgroundColor: widget.colour,
      elevation: widget.elevation,
      mini: true,
    );
  }
}

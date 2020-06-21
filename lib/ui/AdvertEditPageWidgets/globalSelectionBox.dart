import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlobalSelectionBox extends StatefulWidget {

  String title;

  GlobalSelectionBox({
    this.title
  });

  @override
  _GlobalSelectionBoxState createState() => _GlobalSelectionBoxState();
}

class _GlobalSelectionBoxState extends State<GlobalSelectionBox> {

  bool selection = false;

  Color _isSelected(bool check){
    Color selectionColour;

    if(check == true){
      selectionColour = Colors.white;
    } else {
      selectionColour = Colors.white.withOpacity(0.4);
    }

    return selectionColour;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(widget.title, style: TextStyle(color: _isSelected(selection), fontSize: 15.0)),
              Spacer(),
              Icon(selection ? Icons.check_circle : Icons.add, color: _isSelected(selection), size: 14.0)
            ],
          ),
        ],
      ),
    );
  }
}

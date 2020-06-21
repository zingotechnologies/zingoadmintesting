import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectionBox extends StatefulWidget {

  IconData icon;
  String title;

  SelectionBox({
    this.icon,
    this.title
  });

  @override
  _SelectionBoxState createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {

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

    double width;

    if(widget.title.length < 5){
      width = 80.0;
    } else if(widget.title.length >= 5 && widget.title.length < 10) {
      width = 120.0;
    } else if(widget.title.length >= 10 && widget.title.length < 15) {
      width = 135.0;
    } else {
      width = 180.0;
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          selection = !selection;
        });
      },
      child: Container(
        height: 30.0,
        width: width,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(widget.icon, color: _isSelected(selection), size: 14.0),
            SizedBox(width: 5.0),
            Text(widget.title, style: TextStyle(color: _isSelected(selection), fontSize: 15.0)),
            Spacer(),
            Icon(selection ? Icons.check_circle : Icons.add, color: _isSelected(selection), size: 14.0)
          ],
        ),
      ),
    );
  }
}

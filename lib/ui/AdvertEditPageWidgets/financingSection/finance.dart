import 'package:flutter/material.dart';

Widget bottomPart(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: 125.0,
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
                          Text("APARTMENTS", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14.0)),
                          SizedBox(width: 5.0),
                          Icon(Icons.add, color: Colors.white.withOpacity(0.5), size: 12.0)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                    height: 30.0,
                    width: 125.0,
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
                        child: Text("ROOMS LEFT", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14.0))
                    )
                ),
              ],
            ),
            SizedBox(height: 15.0)
          ],
        ),
      ],
    ),
  );
}

class TopFinancePart extends StatefulWidget {
  @override
  _TopFinancePartState createState() => _TopFinancePartState();
}

class _TopFinancePartState extends State<TopFinancePart> {

  bool selection = false;

  Color _isSelected(bool check){
    Color selectionColour;

    if(check == true){
      selectionColour = Colors.white;
    } else {
      selectionColour = Colors.white.withOpacity(0.5);
    }

    return selectionColour;
  }

  Widget _buttonSelection(String title){
    return GestureDetector(
      onTap: (){
        setState(() {
          selection = !selection;
        });
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: _isSelected(selection), fontSize: 15.0)),
            SizedBox(width: 10.0),
            Icon(selection ? Icons.check_circle : Icons.add, color: _isSelected(selection), size: 14.0)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("FINANCING", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20.0)),
          SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buttonSelection("STUDENTS RES"),
              SizedBox(width: 10.0),
              Container(
                  height: 30.0,
                  width: 125.0,
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
                      child: Text("ROOMS LEFT", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14.0))
                  )
              ),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

Widget middleDivision(){
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Divider(
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      SizedBox(height: 10.0),
    ]
  );
}

class BottomFinancePart extends StatefulWidget {
  @override
  _BottomFinancePartState createState() => _BottomFinancePartState();
}

class _BottomFinancePartState extends State<BottomFinancePart> {

  bool selection = false;

  Color _isSelected(bool check){
    Color selectionColour;

    if(check == true){
      selectionColour = Colors.white;
    } else {
      selectionColour = Colors.white.withOpacity(0.5);
    }

    return selectionColour;
  }

  Widget _buttonSelection(String title){
    return GestureDetector(
      onTap: (){
        setState(() {
          selection = !selection;
        });
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: _isSelected(selection), fontSize: 15.0)),
            SizedBox(width: 10.0),
            Icon(selection ? Icons.check_circle : Icons.add, color: _isSelected(selection), size: 14.0)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buttonSelection("APARTMETS"),
              SizedBox(width: 10.0),
              Container(
                  height: 30.0,
                  width: 125.0,
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
                      child: Text("ROOMS LEFT", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14.0))
                  )
              ),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

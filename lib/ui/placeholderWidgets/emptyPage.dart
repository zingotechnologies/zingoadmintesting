import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmptyPage extends StatelessWidget {

  String title;

  EmptyPage({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4d6194),
        elevation: 8.5,
        title: Text(title, style: TextStyle(fontSize: 20.0, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff435480),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Page is empty for now", style: TextStyle(fontSize: 25.0, color: Colors.white)),
              Text("The final build will be published soon", style: TextStyle(fontSize: 18.0, color: Colors.white70))
            ],
          ),
        ),
      ),
    );
  }
}

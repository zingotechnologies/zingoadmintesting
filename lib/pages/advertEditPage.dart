import 'package:flutter/material.dart';
import 'package:zingoadmin/ui/AdvertEditPageWidgets/allSections.dart';
import 'package:zingoadmin/ui/backgroundCircles.dart';
import 'package:zingoadmin/ui/drawerWidgets/globalDrawer.dart';

// ignore: must_be_immutable
class AdvertEditPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  String title = "editresidence";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: GlobalDrawer(selectedTab: title),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _drawerKey.currentState.openDrawer();
        },
        child: Icon(Icons.menu, color: Colors.white),
        backgroundColor: Color(0xff6276a8),
        elevation: 8.5,
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }

  Widget _buildBody(BuildContext context){
    return Stack(
      children: <Widget>[
        backgroundCircles(),
        AllSections()
      ],
    );
  }

}

import 'package:flutter/material.dart';
import 'package:zingoadmin/ui/drawerWidgets/globalDrawer.dart';
import 'package:zingoadmin/ui/globalButton/globalFloatingButton.dart';

// ignore: must_be_immutable
class Contacts extends StatelessWidget {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  String title = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: GlobalDrawer(selectedTab: title),
        body: _buildBody(context),
        floatingActionButton: GlobalFloatingButton(drawerKey: _drawerKey),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }

  Widget _buildBody(BuildContext context){
    return Container(
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
    );
  }
}

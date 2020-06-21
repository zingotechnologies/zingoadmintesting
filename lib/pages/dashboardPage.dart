import 'package:flutter/material.dart';
import 'package:zingoadmin/ui/backgroundCircles.dart';
import 'package:zingoadmin/ui/dashboardWidgets/allDashboardWidgets.dart';
import 'package:zingoadmin/ui/drawerWidgets/globalDrawer.dart';
import 'package:zingoadmin/ui/globalButton/globalFloatingButton.dart';

class Dashboard extends StatefulWidget {

    @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  String title = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: GlobalDrawer(selectedTab: title),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context){
   return Stack(
     children: <Widget>[
       backgroundCircles(),
       allServices(context),
       Positioned(
         top: 30.0,
         right: 20.0,
         child: GlobalFloatingButton(drawerKey: _drawerKey, colour: Colors.blueGrey),
       )
     ],
   );
  }

}

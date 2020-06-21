import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:zingoadmin/ui/drawerWidgets/globalDrawer.dart';
import 'package:zingoadmin/ui/globalButton/globalFloatingButton.dart';

// ignore: must_be_immutable
class AddNewResidence extends StatelessWidget {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  String title = "newresidence";
  Animation animation;

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
        child: Stack(
          children: <Widget>[
            FlareActor('assets/rocketman.flr', animation: 'forward', fit: BoxFit.contain),
            Positioned(
              right: 0,
              left: 0,
              bottom: MediaQuery.of(context).size.height/5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Page is empty for now", style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  Text("The final build will be made available soon", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0)),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

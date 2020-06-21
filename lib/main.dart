import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zingoadmin/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff435480),
    systemNavigationBarIconBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_){
    runApp(ZingoAdmin());
  });
}
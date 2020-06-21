import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zingoadmin/ui/placeholderWidgets/welcome.dart';

// ignore: must_be_immutable
class ZingoAdmin extends StatefulWidget {

  @override
  _ZingoAdminState createState() => _ZingoAdminState();
}

class _ZingoAdminState extends State<ZingoAdmin> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      title: "Zingo Admin",
      home: Welcome(),
    );
  }
}

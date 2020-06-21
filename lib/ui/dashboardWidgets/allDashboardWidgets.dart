import 'package:flutter/material.dart';

import 'residenceList.dart';

Widget allServices(BuildContext context){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50.0),
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ResidenceListBox(),
          )
        ],
      ),
    ),
  );
}
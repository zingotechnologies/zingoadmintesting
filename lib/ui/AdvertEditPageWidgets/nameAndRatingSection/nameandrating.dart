import 'package:flutter/material.dart';
import 'package:zingoadmin/ui/AdvertEditPageWidgets/nameAndRatingSection/rating.dart';
import 'package:zingoadmin/ui/AdvertEditPageWidgets/nameAndRatingSection/residenceName.dart';

Widget nameAndRatingSection(BuildContext context){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      buildName(context),
      SizedBox(height: 15.0),
      rating()
    ],
  );

}
import 'dart:io';

import 'package:flutter/material.dart';

import 'amenitiesSection/amenities.dart';
import 'financingSection/finance.dart';
import 'financingSection/rooms.dart';
import 'nameAndRatingSection/nameandrating.dart';
import 'uploadSection/mediaUploading.dart';

// ignore: must_be_immutable
class AllSections extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MediaUpload(),
              SizedBox(height: 10.0),

              nameAndRatingSection(context),

              _spacing(),

              // The pricing section
              TopFinancePart(),
              RoomItems(),
              middleDivision(),
              BottomFinancePart(),
              RoomItems(),

              _spacing(),

              Amenities(),

              _spacing(),
            ],
          )
      ),
    );
  }

  Widget _spacing(){
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 15.0)
      ],
    );
  }
}
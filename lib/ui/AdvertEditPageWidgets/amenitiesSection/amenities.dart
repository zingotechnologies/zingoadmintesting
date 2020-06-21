import 'package:flutter/material.dart';

import 'package:zingoadmin/ui/AdvertEditPageWidgets/amenitiesSection/selectionBox.dart';
import 'package:zingoadmin/ui/placeholderWidgets/emptyPage.dart';

class Amenities extends StatefulWidget {
  @override
  _AmenitiesState createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {

  String amenities = "Amenities";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("AMENITIES", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20.0)),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Expanded(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectionBox(icon: Icons.wifi, title: "Wifi"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.pets, title: "Pet Friendly"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.kitchen, title: "Kitchen"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.live_tv, title: "TV"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.local_parking, title: "Parking")
                  ],
                ),
              ),
              Expanded(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectionBox(icon: Icons.laptop_windows, title: "Study Areas"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.live_help, title: "24 Hour Help"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.videogame_asset, title: "Games Room"),
                    SizedBox(height: 10.0),
                    SelectionBox(icon: Icons.directions_run, title: "Indoor Gym"),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmptyPage(title: amenities)));
                      },
                      child: Container(
                        height: 30.0,
                        width: 110.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xff6a84c8).withOpacity(0.5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 5),
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: Center(child: Text("INCLUDE MORE", style: TextStyle(color: Colors.white.withOpacity(0.7)))),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}


class MoreAmenities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

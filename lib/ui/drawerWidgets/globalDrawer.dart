import 'package:flutter/material.dart';
import 'package:zingoadmin/app.dart';

import 'package:zingoadmin/pages/ResidenceServices/contactSection.dart';
import 'package:zingoadmin/pages/ResidenceServices/newsletters.dart';
import 'package:zingoadmin/pages/ResidenceServices/tenatsFinanceSection.dart';
import 'package:zingoadmin/pages/ResidenceServices/workdivisions.dart';
import 'package:zingoadmin/pages/advertEditPage.dart';
import 'package:zingoadmin/pages/dashboardPage.dart';
import 'package:zingoadmin/pages/accountPage.dart';
import 'package:zingoadmin/pages/helpPage.dart';
import 'package:zingoadmin/pages/signUpPage.dart';
import 'package:zingoadmin/services/authentication.dart';
import 'package:zingoadmin/ui/AdvertEditPageWidgets/addResidence.dart';
import 'package:zingoadmin/ui/SignupAndLogin/login.dart';

// ignore: must_be_immutable
class GlobalDrawer extends StatefulWidget {

  String selectedTab;
  
  GlobalDrawer({
    @required this.selectedTab
  });
  
  @override
  _GlobalDrawerState createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {

  ZingoAdmin setHome = ZingoAdmin();

  Color _notSelectedTabColour(){
    Color _backgroundColour = Color(0xff435480);
    return _backgroundColour;
  }

  Color _selectedTapColour(){
    Color _backgroundColour = Color(0xff6276a8);
    return _backgroundColour;
  }

  @override
  Widget build(BuildContext context) {
    return _drawer(context);
  }


  Widget _dashboard(){
    return GestureDetector(
      onTap: (){
        widget.selectedTab == "dashboard" ?  Navigator.of(context).pop() : setState(() {
          widget.selectedTab = "dashboard";
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          height: 100.0,
          decoration: BoxDecoration(
              color: widget.selectedTab == "dashboard" ? _selectedTapColour() : _notSelectedTabColour(),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: widget.selectedTab == "dashboard" ?  [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 5),
                    blurRadius: 5
                )
              ] : null
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.dashboard, color: widget.selectedTab == "dashboard" ? Colors.white : Colors.white70),
                  SizedBox(width: 20.0),
                  Text("Dashboard",  style: TextStyle(fontSize: 16.0, color: widget.selectedTab == "dashboard" ? Colors.white : Colors.white70))
                ],
              ),
              SizedBox(height: 20.0),

              // Lower Buttons
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      widget.selectedTab == "dashboard" ?  Navigator.of(context).pop() : setState(() {
                        widget.selectedTab = "dashboard";
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TenantsFinancing()));
                      });
                    },
                    child: Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Color(0xff8db6d8),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 5),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: Center(
                        child: Text("Finance", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: (){
                      widget.selectedTab == "dashboard" ?  Navigator.of(context).pop() : setState(() {
                        widget.selectedTab = "dashboard";
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contacts()));
                      });
                    },
                    child: Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Color(0xff8db6d8),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 5),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: Center(
                        child: Text("Contacts", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _currentAdvert(){
    return  GestureDetector(
      onTap: (){
        widget.selectedTab == "editresidence" ?  Navigator.of(context).pop() : setState(() {
          widget.selectedTab = "editresidence";
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertEditPage()));
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          padding: widget.selectedTab == "editresidence" ? EdgeInsets.symmetric(horizontal: 15.0) : null,
          height: 40.0,
          decoration: BoxDecoration(
                      color: widget.selectedTab == "editresidence" ? _selectedTapColour() : _notSelectedTabColour(),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: widget.selectedTab == "editresidence" ? [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 5
                        )
                      ] : null
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.edit, color: widget.selectedTab == "editresidence" ? Colors.white : Colors.white70),
              SizedBox(width: 20.0),
              Text("Edit Current Residence Ad",  style: TextStyle(fontSize: 16.0, color: widget.selectedTab == "editresidence" ? Colors.white : Colors.white70))
            ],
          ),
        ),
      ),
    );
  }

  Widget _newResidence(){
    return GestureDetector(
      onTap: (){
        widget.selectedTab == "newresidence" ?  Navigator.of(context).pop() : setState(() {
          widget.selectedTab = "newresidence";
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewResidence()));
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          padding: widget.selectedTab == "newresidence" ? EdgeInsets.symmetric(horizontal: 15.0) : null,
          height: 40.0,
          decoration: BoxDecoration(
                      color: widget.selectedTab == "newresidence" ? _selectedTapColour() : _notSelectedTabColour(),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: widget.selectedTab == "newresidence" ? [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 5
                        )
                      ] : null
                  ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home, color: widget.selectedTab == "newresidence" ? Colors.white : Colors.white70),
              SizedBox(width: 20.0),
              Text("Add New Residence",  style: TextStyle(fontSize: 16.0, color: widget.selectedTab == "newresidence" ? Colors.white : Colors.white70))
            ],
          ),
        ),
      ),
    );
  }

  Widget _shortcuts(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                width: 0.8,
                color: Colors.white.withOpacity(0.7)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // One
            GestureDetector(
              onTap: (){
                widget.selectedTab == "workdivisions" ?  Navigator.of(context).pop() : setState(() {
                  widget.selectedTab = "workdivisions";
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkDivisions()));
                });
              },
              child: Container(
                padding: widget.selectedTab == "workdivisions" ? EdgeInsets.symmetric(horizontal: 15.0) : null,
                height: 40.0,
                decoration: BoxDecoration(
                    color: widget.selectedTab == "workdivisions" ? _selectedTapColour() : _notSelectedTabColour(),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: widget.selectedTab == "workdivisions" ? [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 5),
                          blurRadius: 5
                      )
                    ] : null
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shutter_speed, color: widget.selectedTab == "workdivisions" ? Colors.white : Colors.white70),
                    SizedBox(width: 20.0),
                    Text("Work Divisions",  style: TextStyle(fontSize: 16.0, color: widget.selectedTab == "workdivisions" ? Colors.white : Colors.white70))
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.0),
            // Two
            GestureDetector(
              onTap: (){
                widget.selectedTab == "newsletters" ?  Navigator.of(context).pop() : setState(() {
                  widget.selectedTab = "newsletters";
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsLetters()));
                });
              },
              child: Container(
                padding: widget.selectedTab == "newsletters" ? EdgeInsets.symmetric(horizontal: 15.0) : null,
                height: 40.0,
                decoration: BoxDecoration(
                    color: widget.selectedTab == "newsletters" ? _selectedTapColour() : _notSelectedTabColour(),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: widget.selectedTab == "newsletters" ? [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 5),
                          blurRadius: 5
                      )
                    ] : null
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.filter_drama, color: widget.selectedTab == "newsletters" ? Colors.white : Colors.white70),
                    SizedBox(width: 20.0),
                    Text("News Letters",  style: TextStyle(fontSize: 16.0, color: widget.selectedTab == "newsletters" ? Colors.white : Colors.white70))
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


  Widget _account(){
    return ListTile(
      leading: Icon(Icons.account_circle, size: 25, color: Colors.white.withOpacity(0.7)),
      title: Text("Account",  style: TextStyle(fontSize: 18.0, color: Colors.white.withOpacity(0.7))),
      onTap: (){
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Account()));
      },
    );
  }

  Widget _helpSection(){
    return ListTile(
      leading: Icon(Icons.live_help, size: 25, color: Colors.white.withOpacity(0.7)),
      title: Text("Help",  style: TextStyle(fontSize: 18.0, color: Colors.white.withOpacity(0.7))),
      onTap: (){
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Help()));
      },
    );
  }

  Drawer _drawer(BuildContext context){

    Widget divider(){
      return Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: Divider(
              color: Colors.white70,
              thickness: 0.8,
            ),
          ),
          SizedBox(height: 20.0)
        ],
      );
    }

    return Drawer(
        child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Color(0xff435480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                // Company Logo and name Section
                Material(
                  color: Colors.transparent,
                  shadowColor: Colors.black38,
                  elevation: 10,
                  child: UserAccountsDrawerHeader(
                    accountName: Text("Louis Neo"),
                    accountEmail: Text("neophetla.lp@gmail.com"),
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 7),
                                blurRadius: 7
                            )
                          ]
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color(0xff4d6194),
                        child: Text("L", style: TextStyle(fontSize: 22)),
                      ),
                    ),
                    otherAccountsPictures: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 5),
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff6276a8),// Wrap this wit// h a column and add another Circle Avatar
                          child: Icon(Icons.view_list, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),

                // Dashboard Section
                _dashboard(),
                divider(),


                // Edit Current Advert Section
                _currentAdvert(),

                SizedBox(height: 10.0),
                // Adding New Residence
                _newResidence(),

                // Shortcuts
                _shortcuts(),


                SizedBox(height: 20.0),
                Divider(
                  color: Colors.white.withOpacity(0.7),
                  thickness: 0.8,
                ),
                SizedBox(height: 10.0),


                // App Account Section
                _account(),


                // Help Section
                _helpSection(),
                SizedBox(height: 80.0)
              ],
            ),
          ),
        )
    );
  }

}

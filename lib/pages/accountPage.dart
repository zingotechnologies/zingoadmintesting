import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Color(0xff4d6194),
        title: Text("Account", style: TextStyle(fontSize: 22.0, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Container(
      color: Color(0xff435480),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ListTile(
              onTap: (){

              },
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 8),
                          blurRadius: 8
                      )
                    ]
                ),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.blueGrey,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Residence Name", style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  Text("Residence Nickname", style: TextStyle(fontSize: 14.0, color: Colors.white))
                ],
              ),
            ),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.library_books, color: Colors.white),
            title: Text("Documents", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.credit_card, color: Colors.white),
            title: Text("Payments", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.person_pin, color: Colors.white),
            title: Text("Edit Info", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.bug_report, color: Colors.white),
            title: Text("Report App Issues", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.info_outline, color: Colors.white),
            title: Text("About", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.security, color: Colors.white),
            title: Text("Security And Privacy", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          ListTile(
            onTap: (){

            },
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text("App Settings", style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          Divider(
            color: Colors.white70,
            thickness: 0.8,
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).popAndPushNamed('/root');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Text("Sign Out", style: TextStyle(color: Colors.red, fontSize: 18.0)),
            ),
          )
        ],
      ),
    );
  }
}

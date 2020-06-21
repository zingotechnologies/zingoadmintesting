import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Color(0xff4d6194),
        title: Text("Help", style: TextStyle(fontSize: 22.0, color: Colors.white)),
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
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Suggested Topics", style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 15.0)),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.note_add, color: Colors.white),
            title: Text("I want to add a new Residence", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          SizedBox(height: 10.0),
          Divider(thickness: 0.5, color: Colors.white.withOpacity(0.75)),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("All Topics", style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 15.0)),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.assignment, color: Colors.white),
            title: Text("Tenant Issues and Lease Adjustments", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text("Using the app", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin, color: Colors.white),
            title: Text("Account and Payments", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.input, color: Colors.white),
            title: Text("Signing Up to become a Zingo'er", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward, color: Colors.white),
            title: Text("Accessebility", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.security, color: Colors.white),
            title: Text("Residence Safety and Security", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.more, color: Colors.white),
            title: Text("More", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          SizedBox(height: 20.0),
          Divider(thickness: 0.5, color: Colors.white.withOpacity(0.55)),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Support Messages", style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 15.0)),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.archive, color: Colors.white),
            title: Text("View archive", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          SizedBox(height: 20.0),
          Divider(thickness: 0.5, color: Colors.white.withOpacity(0.55)),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Speak to an agent", style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 15.0)),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.call, color: Colors.white),
            title: Text("Call Support", style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onTap: (){

            },
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

}

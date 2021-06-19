import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeamRegisterPage extends StatefulWidget {
  final String name;
  final String rollno;
  final String college;
  final String phone;
  final String team1n;
  final String team1r;
  TeamRegisterPage({
    Key? key,
    required this.name,
    required this.rollno,
    required this.college,
    required this.phone,
    required this.team1n,
    required this.team1r,
  }) : super(key: key);
  @override
  _TeamRegisterPageState createState() => _TeamRegisterPageState();
}

class _TeamRegisterPageState extends State<TeamRegisterPage> {
  @override
  Widget build(BuildContext context) {
    String nam = widget.name;
    String roll = widget.rollno;
    String clg = widget.college;
    String phn = widget.phone;
    String t1n = widget.team1n;
    String t1r = widget.team1r;
    return Scaffold(
      appBar: AppBar(
        // title: Text("Uploads"),
        // centerTitle: true,
        // backgroundColor: Colors.red,
        backgroundColor: Color(0xff5a65ff),
        title: new Text(
          'Registration details',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          nam,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          roll,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Roll Number"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t1n,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teammate 1 Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t1r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 1 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          phn,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Phone"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          clg,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("College"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TeamRegister2Page extends StatefulWidget {
  final String name;
  final String rollno;
  final String college;
  final String phone;
  final String team1n;
  final String team1r;
  final String team2n;
  final String team2r;
  TeamRegister2Page({
    Key? key,
    required this.name,
    required this.rollno,
    required this.college,
    required this.phone,
    required this.team1n,
    required this.team1r,
    required this.team2n,
    required this.team2r,
  }) : super(key: key);
  @override
  _TeamRegister2PageState createState() => _TeamRegister2PageState();
}

class _TeamRegister2PageState extends State<TeamRegister2Page> {
  @override
  Widget build(BuildContext context) {
    String nam = widget.name;
    String roll = widget.rollno;
    String clg = widget.college;
    String phn = widget.phone;
    String t1n = widget.team1n;
    String t1r = widget.team1r;
    String t2n = widget.team2n;
    String t2r = widget.team2r;
    return Scaffold(
      appBar: AppBar(
        // title: Text("Uploads"),
        // centerTitle: true,
        // backgroundColor: Colors.red,
        backgroundColor: Color(0xff5a65ff),
        title: new Text(
          'Registration details',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          nam,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          roll,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Roll Number"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t1n,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teammate 1 Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t1r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 1 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t2n,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teammate 2 Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t2r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 2 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          phn,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Phone"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          clg,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("College"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamRegister3Page extends StatefulWidget {
  final String name;
  final String rollno;
  final String college;
  final String phone;
  final String team3r;
  final String team1r;
  final String team4r;
  final String team2r;
  TeamRegister3Page({
    Key? key,
    required this.name,
    required this.rollno,
    required this.college,
    required this.phone,
    required this.team1r,
    required this.team2r,
    required this.team3r,
    required this.team4r,
  }) : super(key: key);
  @override
  _TeamRegister3PageState createState() => _TeamRegister3PageState();
}

class _TeamRegister3PageState extends State<TeamRegister3Page> {
  @override
  Widget build(BuildContext context) {
    String nam = widget.name;
    String roll = widget.rollno;
    String clg = widget.college;
    String phn = widget.phone;
    String t1r = widget.team1r;
    String t2r = widget.team2r;
    String t3r = widget.team3r;
    String t4r = widget.team4r;
    return Scaffold(
      appBar: AppBar(
        // title: Text("Uploads"),
        // centerTitle: true,
        // backgroundColor: Colors.red,
        backgroundColor: Color(0xff5a65ff),
        title: new Text(
          'Registration details',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          nam,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Name"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          roll,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Roll Number"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t1r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 1 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t2r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 2 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t3r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 3 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          t4r,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("Teamate 4 Rollno"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          phn,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ), // green shaped
                          ),
                          child: Text("Phone"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 97,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(
                          clg,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ) // green shaped
                              ),
                          child: Text("College"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

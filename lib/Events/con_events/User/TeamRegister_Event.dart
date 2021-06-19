import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/firestore/registerpage.dart';

import 'TeamRegisterPage.dart';

class TeamRegister_Event extends StatefulWidget {
  late String contest;
  TeamRegister_Event({required this.contest});
  @override
  _TeamRegister_EventViewState createState() => _TeamRegister_EventViewState();
}

// ignore: camel_case_types
class _TeamRegister_EventViewState extends State<TeamRegister_Event> {
  bool _rollnoc = true;
  bool _t1n = true;
  bool _t1r = true;
  bool _t2n = true;
  bool _t2r = true;
  Future<void> register(String rollno, String team1n, String team1r) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.contest);
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
      (DocumentSnapshot documentSnapshot) {
        users.doc(uid).set(
          {
            'rollno': rollno,
            'uid': uid,
            'registered': true,
            'name': documentSnapshot['displayName'],
            'college': documentSnapshot['college'],
            'phone': documentSnapshot['phone'],
            'branch': documentSnapshot['dept'],
            'team1n': team1n,
            'team1r': team1r,
          },
        );
      },
    );

    return;
  }

  @override
  void initState() {
    _rollnoc = true;
    _t1n = true;
    _t1r = true;
    _t2n = true;
    _t2r = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _rollnoController = TextEditingController();
  TextEditingController _team1rollnoController = TextEditingController();
  TextEditingController _team1nameController = TextEditingController();
  // TextEditingController _topicController = TextEditingController();
  // TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "images/logo.png",
      height: mq.size.height / 4,
    );

    // final topicfield = TextFormField(
    //   controller: _topicController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "topic name",
    //     labelText: "Please insert topic name here",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );

    final rollnoField = TextFormField(
      controller: _rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please insert your roll number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _rollnoc ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team1rollnoField = TextFormField(
      controller: _team1rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please enter your teammate rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t1r ? null : 'Value Can\'t Be Empty',
      ),
    );
    // final team2rollnoField = TextFormField(
    //   controller: _team2rollnoController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "X951XXXXX",
    //     labelText: "Please insert your roll number",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
    final team1nameField = TextFormField(
      controller: _team1nameController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Teammate name",
        labelText: "Please enter your teammate name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t1n ? null : 'Value Can\'t Be Empty',
      ),
    );
    // final team2nameField = TextFormField(
    //   controller: _team2nameController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "X951XXXXX",
    //     labelText: "Please insert your roll number",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
    // final urlfield = TextFormField(
    //   controller: _urlController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "URL",
    //     labelText: "Please insert Youtube url here",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );

    final fields = Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          rollnoField,
          team1nameField,
          team1rollnoField,
          // topicfield,
          // urlfield,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _rollnoController.text.isNotEmpty
                ? _rollnoc = true
                : _rollnoc = false;
            _team1nameController.text.isNotEmpty ? _t1n = true : _t1n = false;
            _team1rollnoController.text.isNotEmpty ? _t1r = true : _t1r = false;
          });
          if (_rollnoc && _t1n && _t1r) {
            register(_rollnoController.text, _team1nameController.text,
                _team1rollnoController.text);
            FirebaseAuth auth = FirebaseAuth.instance;
            String uid = auth.currentUser!.uid.toString();
            FirebaseFirestore.instance
                .collection(widget.contest)
                .doc(uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamRegisterPage(
                      name: documentSnapshot['name'],
                      rollno: documentSnapshot['rollno'],
                      college: documentSnapshot['college'],
                      phone: documentSnapshot['phone'],
                      team1n: documentSnapshot['team1n'],
                      team1r: documentSnapshot['team1r'],
                    ),
                  ),
                );
              } else {
                Fluttertoast.showToast(
                    msg: 'Please wait 10 seconds and Try Again');
              }
            });
          } else {
            if (_rollnoc == false) {
              Fluttertoast.showToast(msg: "Enter a valid Rollno");
            } else if (_t1n == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 name");
            } else if (_t1r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 rollno");
            }
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 75),
                  child: registerButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamRegister2_Event extends StatefulWidget {
  late String contest;
  TeamRegister2_Event({required this.contest});
  @override
  _TeamRegister2_EventViewState createState() =>
      _TeamRegister2_EventViewState();
}

// ignore: camel_case_types
class _TeamRegister2_EventViewState extends State<TeamRegister2_Event> {
  bool _rollnoc = true;
  bool _t1n = true;
  bool _t1r = true;
  bool _t2n = true;
  bool _t2r = true;
  Future<void> register(String rollno, String team1n, String team1r,
      String team2n, String team2r) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.contest);
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
      (DocumentSnapshot documentSnapshot) {
        users.doc(uid).set(
          {
            'rollno': rollno,
            'uid': uid,
            'registered': true,
            'name': documentSnapshot['displayName'],
            'college': documentSnapshot['college'],
            'phone': documentSnapshot['phone'],
            'branch': documentSnapshot['dept'],
            'team1n': team1n,
            'team1r': team1r,
            'team2n': team2n,
            'team2r': team2r,
          },
        );
      },
    );

    return;
  }

  @override
  void initState() {
    _rollnoc = true;
    _t1n = true;
    _t1r = true;
    _t2n = true;
    _t2r = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _rollnoController = TextEditingController();
  TextEditingController _team1rollnoController = TextEditingController();
  TextEditingController _team1nameController = TextEditingController();
  TextEditingController _team2nameController = TextEditingController();
  TextEditingController _team2rollnoController = TextEditingController();
  // TextEditingController _topicController = TextEditingController();
  // TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "images/logo.png",
      height: mq.size.height / 5,
    );

    // final topicfield = TextFormField(
    //   controller: _topicController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "topic name",
    //     labelText: "Please insert topic name here",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );

    final rollnoField = TextFormField(
      controller: _rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please insert your roll number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _rollnoc ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team1rollnoField = TextFormField(
      controller: _team1rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Teammate 1 rollno",
        labelText: "Please enter your teammate 1 rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t1r ? null : 'Value Can\'t Be Empty',
      ),
    );
    // final team2rollnoField = TextFormField(
    //   controller: _team2rollnoController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "X951XXXXX",
    //     labelText: "Please insert your roll number",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
    final team1nameField = TextFormField(
      controller: _team1nameController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Teammate 1 name",
        labelText: "Please enter your teammate 1 name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t1n ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team2nameField = TextFormField(
      controller: _team2nameController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Teammate 2 name",
        labelText: "Please enter your teammate 2 name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t2n ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team2rollnoField = TextFormField(
      controller: _team2rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Teammate 2 rollno",
        labelText: "Please enter your teammate 2 rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t2r ? null : 'Value Can\'t Be Empty',
      ),
    );
    // final team2nameField = TextFormField(
    //   controller: _team2nameController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "X951XXXXX",
    //     labelText: "Please insert your roll number",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
    // final urlfield = TextFormField(
    //   controller: _urlController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "URL",
    //     labelText: "Please insert Youtube url here",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );

    final fields = Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          rollnoField,
          team1nameField,
          team1rollnoField,
          team2nameField,
          team2rollnoField,
          // topicfield,
          // urlfield,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _rollnoController.text.isNotEmpty
                ? _rollnoc = true
                : _rollnoc = false;
            _team1nameController.text.isNotEmpty ? _t1n = true : _t1n = false;
            _team1rollnoController.text.isNotEmpty ? _t1r = true : _t1r = false;
            _team2nameController.text.isNotEmpty ? _t2n = true : _t2n = false;
            _team2rollnoController.text.isNotEmpty ? _t2r = true : _t2r = false;
          });
          if (_rollnoc && _t1n && _t1r && _t2r && _t2n) {
            register(
                _rollnoController.text,
                _team1nameController.text,
                _team1rollnoController.text,
                _team2nameController.text,
                _team2rollnoController.text);
            FirebaseAuth auth = FirebaseAuth.instance;
            String uid = auth.currentUser!.uid.toString();
            FirebaseFirestore.instance
                .collection(widget.contest)
                .doc(uid)
                .get()
                .then(
              (DocumentSnapshot documentSnapshot) {
                if (documentSnapshot.exists) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamRegister2Page(
                        name: documentSnapshot['name'],
                        rollno: documentSnapshot['rollno'],
                        college: documentSnapshot['college'],
                        phone: documentSnapshot['phone'],
                        team1n: documentSnapshot['team1n'],
                        team1r: documentSnapshot['team1r'],
                        team2n: documentSnapshot['team2n'],
                        team2r: documentSnapshot['team2r'],
                      ),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: 'Please wait 10 seconds and Try Again');
                }
              },
            );
          } else {
            if (_rollnoc == false) {
              Fluttertoast.showToast(msg: "Enter a valid Rollno");
            } else if (_t1n == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 name");
            } else if (_t1r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 rollno");
            } else if (_t2n == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate2 name");
            } else if (_t2r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate2 rollno");
            }
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
              height: mq.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  logo,
                  fields,
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: registerButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TeamRegister3_Event extends StatefulWidget {
  late String contest;
  TeamRegister3_Event({required this.contest});
  @override
  _TeamRegister3_EventViewState createState() =>
      _TeamRegister3_EventViewState();
}

// ignore: camel_case_types
class _TeamRegister3_EventViewState extends State<TeamRegister3_Event> {
  bool _rollnoc = true;
  bool _t1r = true;
  bool _t2r = true;
  bool _t3r = true;
  bool _t4r = true;
  Future<void> register(String rollno, String team2r, String team1r,
      String team3r, String team4r) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.contest);
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
      (DocumentSnapshot documentSnapshot) {
        users.doc(uid).set(
          {
            'rollno': rollno,
            'uid': uid,
            'registered': true,
            'name': documentSnapshot['displayName'],
            'college': documentSnapshot['college'],
            'phone': documentSnapshot['phone'],
            'branch': documentSnapshot['dept'],
            'team2r': team2r,
            'team1r': team1r,
            'team3r': team3r,
            'team4r': team4r,
          },
        );
      },
    );

    return;
  }

  @override
  void initState() {
    _rollnoc = true;
    _t1r = true;
    _t2r = true;
    _t3r = true;
    _t4r = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _rollnoController = TextEditingController();
  TextEditingController _team1rollnoController = TextEditingController();
  TextEditingController _team2rollController = TextEditingController();
  TextEditingController _team3rollController = TextEditingController();
  TextEditingController _team4rollController = TextEditingController();
  // TextEditingController _topicController = TextEditingController();
  // TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "images/logo.png",
      height: mq.size.height / 4,
    );

    // final topicfield = TextFormField(
    //   controller: _topicController,
    //   style: TextStyle(
    //     color: Colors.black,
    //   ),
    //   cursorColor: Colors.black,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //     hintText: "topic name",
    //     labelText: "Please insert topic name here",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );

    final rollnoField = TextFormField(
      controller: _rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please insert your roll number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _rollnoc ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team1rollnoField = TextFormField(
      controller: _team1rollnoController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please enter your teammate rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t1r ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team2rollnoField = TextFormField(
      controller: _team2rollController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please enter your teammate rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t2r ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team3rollnoField = TextFormField(
      controller: _team3rollController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please enter your teammate rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t3r ? null : 'Value Can\'t Be Empty',
      ),
    );
    final team4rollnoField = TextFormField(
      controller: _team4rollController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "X951XXXXX",
        labelText: "Please enter your teammate rollno",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _t4r ? null : 'Value Can\'t Be Empty',
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          rollnoField,
          team1rollnoField,
          team2rollnoField,
          team3rollnoField,
          team4rollnoField,
          // topicfield,
          // urlfield,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _rollnoController.text.isNotEmpty
                ? _rollnoc = true
                : _rollnoc = false;
            _team2rollController.text.isNotEmpty ? _t2r = true : _t2r = false;
            _team3rollController.text.isNotEmpty ? _t3r = true : _t3r = false;
            _team4rollController.text.isNotEmpty ? _t4r = true : _t4r = false;
            _team1rollnoController.text.isNotEmpty ? _t1r = true : _t1r = false;
          });
          if (_rollnoc && _t1r && _t2r && _t3r && _t4r) {
            register(
                _rollnoController.text,
                _team2rollController.text,
                _team1rollnoController.text,
                _team3rollController.text,
                _team4rollController.text);
            FirebaseAuth auth = FirebaseAuth.instance;
            String uid = auth.currentUser!.uid.toString();
            FirebaseFirestore.instance
                .collection(widget.contest)
                .doc(uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamRegister3Page(
                      name: documentSnapshot['name'],
                      rollno: documentSnapshot['rollno'],
                      college: documentSnapshot['college'],
                      phone: documentSnapshot['phone'],
                      team1r: documentSnapshot['team1r'],
                      team2r: documentSnapshot['team2r'],
                      team3r: documentSnapshot['team3r'],
                      team4r: documentSnapshot['team4r'],
                    ),
                  ),
                );
              } else {
                Fluttertoast.showToast(
                    msg: 'Please wait 10 seconds and Try Again');
              }
            });
          } else {
            if (_rollnoc == false) {
              Fluttertoast.showToast(msg: "Enter a valid Rollno");
            } else if (_t2r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate2 rollno");
            } else if (_t1r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 rollno");
            } else if (_t3r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 rollno");
            } else if (_t4r == false) {
              Fluttertoast.showToast(msg: "Enter a valid Teammate1 rollno");
            }
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 75),
                  child: registerButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/firestore/registerpage.dart';

class Register_Event extends StatefulWidget {
  late String contest;
  Register_Event({required this.contest});
  @override
  _Register_EventViewState createState() => _Register_EventViewState();
}

// ignore: camel_case_types
class _Register_EventViewState extends State<Register_Event> {
  bool _rollnoc = true;
  Future<void> register(String rollno) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.contest);
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      users.doc(uid).set({
        'rollno': rollno,
        'uid': uid,
        'registered': true,
        'name': documentSnapshot['displayName'],
        'college': documentSnapshot['college'],
        'phone': documentSnapshot['phone'],
        'branch': documentSnapshot['dept'],
      });
    });

    return;
  }

  @override
  void initState() {
    _rollnoc = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _rollnoController = TextEditingController();
  // TextEditingController _team1rollnoController = TextEditingController();
  // TextEditingController _team2rollnoController = TextEditingController();
  // TextEditingController _team1nameController = TextEditingController();
  // TextEditingController _team2nameController = TextEditingController();
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
    // final team1rollnoField = TextFormField(
    //   controller: _team1rollnoController,
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
    //     labelText: "Please enter your teammate rollno",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
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
    // final team1nameField = TextFormField(
    //   controller: _team1nameController,
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
    //     hintText: "Teammate name",
    //     labelText: "Please enter your teammate name",
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.black,
    //     ),
    //   ),
    // );
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
            _rollnoController.text.isEmpty ? _rollnoc = false : _rollnoc = true;
          });
          if (_rollnoc) {
            register(_rollnoController.text);
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
                    builder: (context) => RegisterPage(
                      name: documentSnapshot['name'],
                      rollno: documentSnapshot['rollno'],
                      college: documentSnapshot['college'],
                      phone: documentSnapshot['phone'],
                      branch: documentSnapshot['branch'],
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
              Fluttertoast.showToast(msg: "Enter a valid Roll number");
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
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
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

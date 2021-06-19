import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/HomeScreen/homescreen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'Please wait here until you verify',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      },
      child: Scaffold(
        body: Center(
          // child: Text(
          //   'An Email has been sent to ${user.email}\nplease verify and don\'t \nclose the screen until you verify.',
          //   style: TextStyle(
          //     color: Colors.black,
          //   ),
          // ),
          child: SizedBox(
            width: 350,
            height: 400,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Text(
                      'An Email has been sent to ${user.email}\nplease verify and don\'t \nclose the screen until you verify.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ) // green shaped
                          ),
                      child: Text("Message"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid.toString();
      FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        users.doc(uid).update({'verified': true});
      });
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}

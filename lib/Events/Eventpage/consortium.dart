import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Events/con_events/Admin/aero.dart';
import 'package:untitled/Events/con_events/Admin/bridge.dart';
import 'package:untitled/Events/con_events/Admin/elocution.dart';
import 'package:untitled/Events/con_events/Admin/paper.dart';
import 'package:untitled/Events/con_events/Admin/photo_short.dart';
import 'package:untitled/Events/con_events/Admin/poster.dart';
import 'package:untitled/Events/con_events/Admin/pro_expo.dart';
import 'package:untitled/Events/con_events/Admin/quiz.dart';
import 'package:untitled/Events/con_events/User/aero.dart';
import 'package:untitled/Events/con_events/User/bridge.dart';
import 'package:untitled/Events/con_events/User/elocution.dart';
import 'package:untitled/Events/con_events/User/paper.dart';
import 'package:untitled/Events/con_events/User/photo_short.dart';
import 'package:untitled/Events/con_events/User/poster.dart';
import 'package:untitled/Events/con_events/User/pro_expo.dart';
import 'package:untitled/Events/con_events/User/quiz.dart';

// ignore: must_be_immutable
class Consortium extends StatelessWidget {
  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
  ];

  List data1 = [
    {"event": "Paper\nPresentation"},
    {"event": "Poster\nPresentation"},
    {"event": "Photography\nand\nShortFilm"},
    {"event": "Project\nExpo"},
    {"event": "Bridge\nMockup"},
    {"event": "Aero\nModeling"},
    {"event": "Technical\nQuiz"},
    {"event": "Elocution"},
  ];
  List icons = [
    {"icon": Icons.book},
    {"icon": Icons.settings},
    {"icon": Icons.add_a_photo},
    {"icon": Icons.android},
    {"icon": Icons.equalizer},
    {"icon": Icons.flight},
    {"icon": Icons.computer},
    {"icon": Icons.mic},
  ];

  List events = [
    {"event": new Paper()},
    {"event": new Poster()},
    {"event": new PhotoShort()},
    {"event": new ProjectExpo()},
    {"event": new BridgeMockup()},
    {"event": new Aero()},
    {"event": new Quiz()},
    {"event": new Elocution()},
  ];

  // ignore: non_constant_identifier_names
  List admin_events = [
    {"event": new Paper_Admin()},
    {"event": new Poster_Admin()},
    {"event": new PhotoShort_Admin()},
    {"event": new ProjectExpo_Admin()},
    {"event": new BridgeMockup_Admin()},
    {"event": new Aero_Admin()},
    {"event": new Quiz_Admin()},
    {"event": new Elocution_Admin()},
  ];
  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                String uid = auth.currentUser!.uid.toString();
                FirebaseFirestore.instance
                    .collection('Users')
                    .doc(uid)
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {
                  print(documentSnapshot.data());
                  print(documentSnapshot['admin']);
                  if (documentSnapshot['admin']) {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                admin_events[index]['event']));
                  } else {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => events[index]["event"]));
                  }
                });
              },
              color: data[index]["color"],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "        ",
                          style: TextStyle(color: colorwhite, fontSize: 16),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              color: Color.fromRGBO(255, 255, 255, 0.38)),
                          child: Icon(
                            icons[index]["icon"],
                            color: colorwhite,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        child: Text(
                          data1[index]["event"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: colorwhite,
                          ),
                        )),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 10),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

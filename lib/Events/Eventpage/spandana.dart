import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Events/spa_events/Admin/anthyakshari.dart';
import 'package:untitled/Events/spa_events/Admin/dancing.dart';
import 'package:untitled/Events/spa_events/Admin/drawing.dart';
import 'package:untitled/Events/spa_events/Admin/mehandi.dart';
import 'package:untitled/Events/spa_events/Admin/mimicry.dart';
import 'package:untitled/Events/spa_events/Admin/nailart.dart';
import 'package:untitled/Events/spa_events/Admin/pot_painting.dart';
import 'package:untitled/Events/spa_events/Admin/rangoli.dart';
import 'package:untitled/Events/spa_events/Admin/singing.dart';
import 'package:untitled/Events/spa_events/Admin/vegetable.dart';
import 'package:untitled/Events/spa_events/User/anthyakshari.dart';
import 'package:untitled/Events/spa_events/User/dancing.dart';
import 'package:untitled/Events/spa_events/User/drawing.dart';
import 'package:untitled/Events/spa_events/User/mehandi.dart';
import 'package:untitled/Events/spa_events/User/mimicry.dart';
import 'package:untitled/Events/spa_events/User/nailart.dart';
import 'package:untitled/Events/spa_events/User/pot_painting.dart';
import 'package:untitled/Events/spa_events/User/rangoli.dart';
import 'package:untitled/Events/spa_events/User/singing.dart';
import 'package:untitled/Events/spa_events/User/vegetable.dart';

// ignore: must_be_immutable
class Spandana extends StatelessWidget {
  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
  ];

  List data1 = [
    {"event": "Singing"},
    {"event": "Dancing"},
    {"event": "Mono Action\n(or)\nMimicry"},
    {"event": "Vegetable\nCarving"},
    {"event": "Pot\nPainting"},
    {"event": "Drawing\n(or)\nPainting"},
    {"event": "Rangoli"},
    {"event": "Mehandi"},
    {"event": "Nail\nArt"},
    {"event": "Anthyakshari"},
  ];
  List icons = [
    {"icon": Icons.mic_external_on},
    {"icon": Icons.person_sharp},
    {"icon": Icons.person_search_sharp},
    {"icon": Icons.agriculture},
    {"icon": Icons.format_paint},
    {"icon": Icons.brush_outlined},
    {"icon": Icons.brush},
    {"icon": Icons.person},
    {"icon": Icons.brush},
    {"icon": Icons.people},
  ];

  List events = [
    {"event": new Singing()},
    {"event": new Dancing()},
    {"event": new Mimicry()},
    {"event": new VegCarving()},
    {"event": new PotPainting()},
    {"event": new Drawing()},
    {"event": new Rangoli()},
    {"event": new Mehandi()},
    {"event": new Nailart()},
    {"event": new Anthyakshari()},
  ];

  // ignore: non_constant_identifier_names
  List admin_events = [
    {"event": new Singing_Admin()},
    {"event": new Dancing_Admin()},
    {"event": new Mimicry_Admin()},
    {"event": new VegCarving_Admin()},
    {"event": new PotPainting_Admin()},
    {"event": new Drawing_Admin()},
    {"event": new Rangoli_Admin()},
    {"event": new Mehandi_Admin()},
    {"event": new Nailart_Admin()},
    {"event": new Anthyakshari_Admin()},
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
                  // print(documentSnapshot.data());
                  // print(documentSnapshot['admin']);
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
                          "                      ",
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
                            size: 22,
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

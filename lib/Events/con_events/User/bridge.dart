import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Events/con_events/User/register_event.dart';
import 'package:untitled/Events/con_events/User/upload.dart';

class BridgeMockup extends StatefulWidget {
  @override
  _BridgeMockupState createState() => _BridgeMockupState();
}

class _BridgeMockupState extends State<BridgeMockup> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text(
              buttonTitle,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: tintColor),
            ),
          )
        ],
      );
    }

    Widget twoButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 150,
            margin: EdgeInsets.all(30),
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
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => Register_Event(
                        contest: "BridgeModelling",
                      ),
                    ),
                  );
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff5a65ff), Color(0xff5a65ff)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    final bottomTextSection = new Container(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "General Rules:\n",
                style: TextStyle(
                    color: Color(0xff5a65ff),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              TextSpan(
                text: '1)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    ' It is a solo event and the participant should be undergraduate engineering student from any discipline.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '2)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'The structures made will be tested on the day of the event through the online platform.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '3)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Following materials may be used:\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '   i)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    ' Use Ice cream sticks having the following maximum dimensions: Length = 11 cm, Breadth = 1.2 cm and Width = 0.2cm\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '   ii)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'Sticks can be altered physically by cutting or notching at any angle\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '4)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'Only glue can be used as adhesive. Binding with threads is not allowed.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '5)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'The Ice cream bridge dimensions should be within the specified limits of: Length = 56-60 cm, Width = 10-11 cm and Height = 12-16 cm.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '6)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'The bridge must weigh 250 grams or less.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '7)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'The scoring of the structure will be based on performance as well as aesthetics.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '8)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'The bridge will be scored on how well the material has been used to support the load. \n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '9)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'The efficiency will be calculated as the ratio of ultimate load capacity and the bridge weight.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '10)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'Hang load gradually from 1 kg and above using S – shaped hook until the bridge deformation is observed.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '11)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'Following configuration may be followed for the prepared models:\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '   a)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'A 15cm height by 60cm wide clearance must be provided along the entire length of the bridge which was shown in the following figure as a reference.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
            ],
          ),
        ));

    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color(0xff5a65ff),
              title: new Text(
                'Bridge Mockup',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[],
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.network(
                  'https://alisayaoportfolio.files.wordpress.com/2015/11/preview1.jpg',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                //You can add more widget bellow

                bottomTextSection,
                new Image.network(
                  'https://drive.google.com/uc?export=view&id=1ePrGG2dcNPe5yvi-v3GevPL4xWC0JXGh',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                //bottomTectSecrion1,
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                ),
                Text(
                  "    FACULTY INCHARGES",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff5a65ff),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                SingleChildScrollView(
                  child: DataTable(
                      //sortAscending: true,
                      sortColumnIndex: 0,
                      columnSpacing: 0.0,
                      dataRowHeight: 70.0,
                      headingRowHeight: 40.0,
                      columns: [
                        DataColumn(
                          label: Text(
                            "Name",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Dept",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Phone",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Mr. N. Venkat Rao",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "CE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "9959884339",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ))
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Mr. B. Suresh",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "CE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "8143381500",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ))
                        ]),
                      ]),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                ),
                Text(
                  "    STUDENT VOLUNTEERS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff5a65ff),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                SingleChildScrollView(
                  child: DataTable(
                      //sortAscending: true,
                      sortColumnIndex: 0,
                      columnSpacing: 0.0,
                      dataRowHeight: 70.0,
                      headingRowHeight: 40.0,
                      columns: [
                        DataColumn(
                          label: Text(
                            "Name",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Dept",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Phone",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Mr. Prateek",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "CE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "8466810005",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Mr. Swamy Charan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "CE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "9705428294",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Ms. Tejaswini",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "CE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "7702733799",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Mr. Vamshi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "CE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "9989571718",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ]),
                      ]),
                ),

                twoButtonsSection
              ],
            ))); //Widget with "Material design"
  }
}

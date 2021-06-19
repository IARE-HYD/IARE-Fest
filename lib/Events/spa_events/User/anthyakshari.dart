import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Events/con_events/User/TeamRegister_Event.dart';
import 'package:untitled/Events/con_events/User/register_event.dart';

class Anthyakshari extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<Anthyakshari> {
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
                      builder: (BuildContext context) => TeamRegister2_Event(
                        contest: "Anthyakshari",
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
                      colors: [Color(0xff2ac3ff), Color(0xff2ac3ff)],
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
                text: "Rules:\n",
                style: TextStyle(
                    color: Color(0xff2ac3ff),
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
                    'Participants should be undergraduate engineering students from any discipline with a team of 3 members.\n',
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
                text: 'Only Telugu and Hindi songs are allowed.\n',
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
                text: ' No song can be repeated in the competition.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: """4)""",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                    'All teams have to start any song from the first line or lyric.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                  text: '5)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              TextSpan(
                  text:
                      'All teams are required to sing with original lyrics, at least first two lines of the song that you attempt.\n',
                  style: TextStyle(
                      fontFamily: 'Nunito', fontSize: 18, color: Colors.black)),
              TextSpan(
                  text: '6)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              TextSpan(
                  text:
                      'All teams are advised to play a healthy game; no team is advised to use any judgmental statement like singing quality or skill.\n',
                  style: TextStyle(
                      fontFamily: 'Nunito', fontSize: 18, color: Colors.black)),
              TextSpan(
                  text: '7)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              TextSpan(
                  text: 'There will be five rounds of different modes.\n',
                  style: TextStyle(
                      fontFamily: 'Nunito', fontSize: 18, color: Colors.black)),
            ],
          ),
        ));

    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color(0xff2ac3ff),
              title: new Text(
                'Anthakshari',
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
                  'https://images.newindianexpress.com/uploads/user/imagelibrary/2016/9/23/22/w600X300/ANTAKSHARI.jpg',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                //You can add more widget bellow

                bottomTextSection,
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                ),
                Text(
                  "    FACULTY INCHARGES",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff2ac3ff),
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
                              "Mr. Md Khadir",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "ECE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "8019779400",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ))
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              "Ms. J Sravana",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "ECE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "9052813190",
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
                      color: Color(0xff2ac3ff),
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
                            "Ms. Vandana",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                        DataCell(
                          Text(
                            "ECE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                        DataCell(
                          Text(
                            "7075481171",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                      ]),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              " Mr. P Jayanth",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "ECE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "8341149285",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                twoButtonsSection
              ],
            ))); //Widget with "Material design"
  }
}

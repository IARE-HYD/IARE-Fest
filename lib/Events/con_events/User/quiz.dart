import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'TeamRegister_Event.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
                        contest: "TechnicalQuiz",
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
                      colors: [Color(0xffff6968), Color(0xffff6968)],
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
                    color: Color(0xffff6968),
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
                text:
                    'Team members from same or different disciplines are allowed.\n',
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
                text:
                    'Questions will be asked to each group. If answered correctly, 10 marks will be awarded per question. No passing of the questions to next group.\n',
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
                text: '  i)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 1: C Programming questions.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: """  ii)""",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 2: Engineering Physics questions.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '  iii)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 3: Power puzzle and Linear Algebra questions.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: """  iv)""",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 4: Basics of Electrical& Electronics questions.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '  v)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 5: General Knowledge questions.\n',
                style: TextStyle(
                    color: Colors.black, fontSize: 18.0, fontFamily: 'Nunito'),
              ),
              TextSpan(
                text: '  vi)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Round 6: Puzzle questions.',
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
              backgroundColor: Color(0xffff6968),
              title: new Text(
                'Technical Quiz',
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
                  'https://d1ymz67w5raq8g.cloudfront.net/Pictures/480xany/6/5/5/509655_shutterstock_1506580442_769367.jpg',
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
                      color: Color(0xffff6968),
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
                              "Dr. Ranjith Kumar",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "EEE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "9966959593",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          ))
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text(
                              " Ms. B Navothna",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(Text(
                            "EEE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Nunito'),
                          )),
                          DataCell(Text(
                            "9640823499",
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
                      color: Color(0xffff6968),
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
                              "Ms.V Tejaswi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "EEE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "8367251604",
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
                              "Mr. N Abhishek",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "EEE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "9121263024",
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
                              "Ms. K Keerthana\nReddy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "EEE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "9492428684",
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
                              "Mr. V Vishnu\nVardhan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "EEE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          DataCell(
                            Text(
                              "6303084894",
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

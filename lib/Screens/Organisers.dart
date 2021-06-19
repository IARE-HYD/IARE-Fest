import 'package:flutter/material.dart';

class Organisers extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<Organisers>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff96da45);

  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff96da45),
        title: Text('Organisers', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text(''),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300]),
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(5),
                labelColor: Colors.white,
                unselectedLabelColor: colorstheme,
                labelStyle: TextStyle(fontSize: 20),
                labelPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                indicator: BoxDecoration(
                    color: colorstheme,
                    borderRadius: BorderRadius.circular(20)),
                controller: _tabController,
                tabs: [
                  Text('Conveners'),
                  Text('Co-Ordinators'),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Conveners(),
              Coordinators(),
            ]),
          )
        ],
      ),
    );
  }
}

class Conveners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'MyApp';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/IMG_2407_0.JPG',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Dr. D Shobha Rani'),
                        subtitle: Text('Convener (PHD Professor EEE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'http://buildit.iare.ac.in/images/team/drramu.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Dr.G Ramu'),
                        subtitle: Text('Co-Convener (Skill Development, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/DrSureshGoud.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Dr.J Suresh Goud'),
                        subtitle: Text(
                            'Co-Convener (Assistance Professor, Mathematics, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/Raju_Admissions.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr.B Raju'),
                        subtitle: Text(
                            'Co-Convener (Assistance Professor, Chemistry, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coordinators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'MyApp';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/Devaraj_aero.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. S Devraj'),
                        subtitle: Text(
                            'Faculty Coordinator(Assistance Professor, AE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/Screenshot_1_2.png',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. N Rajashekar'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, CSE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/DSC08775.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Ms. B Ramyasree'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, CSE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/clsvijayadurga.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Ms. C S L Vijaya Durga'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, IT, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/bashaiareece.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. D Khalandar Basha'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, ECE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/10044_0.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mrs. G Mary Swarna Latha'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, ECE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/satisheee.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. A Sathish Kumar'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, EEE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/VIJAY%20KRISHNA_0.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. B. Vijaya Krishna'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, ME, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/Resized-ANBI5.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mr. CH VSS Sudheer'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, CE, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'https://www.iare.ac.in/sites/default/files/iare10442_0.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Mrs. K Lakshmi Revathi'),
                        subtitle: Text(
                            'Faculty Coordinator (Assistance Professor, MBA, IARE)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

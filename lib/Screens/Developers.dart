import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<Developers>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff4b4b87);

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
        backgroundColor: Color(0xff7a54ff),
        title: Text('Core Team', style: TextStyle(color: Colors.white)),
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
                  Text('Mentors'),
                  Text('Developers'),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Mentors(),
              Developer(),
            ]),
          )
        ],
      ),
    );
  }
}

const _arv = 'https://armr.tech';
const _shar = 'https://sharwansolanki.tech';

class Developer extends StatelessWidget {
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
                  onTap: () => _launchURL("https://armr.tech/bala.html"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          'https://sharwansolanki.tech/images/bala.jpg',
                          // width: 300,
                          height: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      ListTile(
                        title: Text('Balavardhan Reddy Malyala'),
                        subtitle: Text('Developer (III CSE, IARE)'),
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
                  onTap: () => _launchURL(_arv),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network("https://armr.tech/images/aru.jpg",
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fitHeight),
                      ),
                      ListTile(
                        title: Text('Aravind Reddy Mokireddy'),
                        subtitle: Text('Developer (III CSE, IARE)'),
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
                  onTap: () => _launchURL(_shar),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          'https://sharwansolanki.tech/images/p2.gif',
                          // width: 300,
                          height: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      ListTile(
                        title: Text('Sharwan Solanki'),
                        subtitle: Text('Developer (III CSE, IARE)'),
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
                  onTap: () => _launchURL("https://armr.tech/jayanth.html"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          'https://sharwansolanki.tech/images/jayanth.gif',
                          // width: 300,
                          height: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      ListTile(
                        title: Text('Jayanth Naidu'),
                        subtitle: Text('Developer (II CSE, IARE)'),
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

class Mentors extends StatelessWidget {
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
                            'https://iare.ac.in/sites/default/files/lvnfinal_1.png',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Dr.L V Narasimha Prasad'),
                        subtitle: Text('Mentor (Principal, IARE)'),
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
                            'http://buildit.iare.ac.in/images/team/drramu.jpg',
                            // width: 300,
                            height: 300,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Dr.G Ramu'),
                        subtitle: Text('Mentor (Skill Development, IARE)'),
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

void _launchURL(_url) async {
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

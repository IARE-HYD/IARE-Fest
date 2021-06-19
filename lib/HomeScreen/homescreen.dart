import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Events/Eventpage/home.dart';
import 'package:untitled/Screens/Developers.dart';
import 'package:untitled/Screens/Organisers.dart';
import 'package:untitled/Screens/about.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List data = [
    {"color": Color(0xffe53935)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xff2ac3ff)},
  ];

  List data1 = [
    {"event": "Events"},
    {"event": "Organisers"},
    {"event": "Developers"},
    {"event": " About"},
  ];
  List icons = [
    {"icon": Icons.event},
    {"icon": Icons.people},
    {"icon": Icons.people},
    {"icon": Icons.help},
  ];
  List events = [
    {"event": new TabView()},
    {"event": new Organisers()},
    {"event": new Developers()},
    {"event": new About()},
  ];
  final colorwhite = Colors.white;
  // final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //   onPrimary: Colors.black87,
  //   primary: Colors.grey[300],
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: 16),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2)),
  //   ),
  // );
  Future<void> checkUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    String ObtainedEmail = "";
    if (prefs.getString('email') == null) {
      print("===>yes0");
      Navigator.of(context).popAndPushNamed("/auth-login");
    } else {
      print("===>No");
      Navigator.of(context).popAndPushNamed("/menu");
    }
  }

  @override
  Widget build(BuildContext context) {
    // checkUser(context);
    //  print("===>yes1");
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'Click Sign Out button to Log off your account',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      },
      child: Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.white10,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.transparent, width: 2),
              ),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                // await FirebaseAuth.instance.signOut();
                prefs.remove('email');
                Navigator.of(context).popAndPushNamed('/auth-login');
              },
              child: Text(
                "Sign Out",
                style: GoogleFonts.odibeeSans(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
          leading: InkWell(
            onTap: () {},
            child: Icon(Icons.arrow_back_ios, color: Colors.white10),
          ),
        ),

        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .38,
              decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("images/college.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SearchBar(),
                    // Container(
                    //   child: SignOutButton,
                    // ),
                    SearchBar(),
                    Expanded(
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: .1,
                          mainAxisSpacing: 10,
                          // crossAxisSpacing: 10
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 0.5),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(

                                      //passing values to prod
                                      builder: (context) =>
                                          events[index]["event"])),
                              child: Card(
                                color: data[index]["color"],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "        ",
                                            style: TextStyle(
                                                color: colorwhite,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.38)),
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
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 5),
                                          child: Text(
                                            data1[index]["event"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 24,
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   child: AppBar(
            //     title: Text(""),
            //     backgroundColor: Colors.transparent,
            //     elevation: 0,
            //     actions: <Widget>[
            //       // ignore: deprecated_member_use
            //       RaisedButton(
            //         color: Colors.white10,
            //         shape: StadiumBorder(
            //           side: BorderSide(color: Colors.transparent, width: 2),
            //         ),
            //         onPressed: () async {
            //           await FirebaseAuth.instance.signOut();
            //           Navigator.pushNamed(context, '/auth-login');
            //         },
            //         child: Text(
            //           "Sign Out",
            //           style: GoogleFonts.odibeeSans(
            //             color: Colors.black,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //       // IconButton(
            //       //   icon: Icon(Icons.person),
            //       //   onPressed: () async {
            //       //     await FirebaseAuth.instance.signOut();
            //       //     Navigator.pushNamed(context, '/auth-login');
            //       //   },
            //       //   tooltip: 'Sign Out',
            //       //   color: Colors.red,
            //       //   iconSize: 50,
            //       // ),
            //     ],
            //   ),
            // ),

            // ElevatedButton(
            //   style: raisedButtonStyle,
            //   onPressed: () async {
            //     final SharedPreferences prefs =
            //         await SharedPreferences.getInstance();
            //     // await FirebaseAuth.instance.signOut();
            //     prefs.remove('email');
            //     Navigator.of(context).pushNamedAndRemoveUntil(
            //         '/auth-login', (Route<dynamic> route) => false);
            //   },
            //   child: Text('Sign Out'),
            // )
          ],
        ),
      ),
    );
  }
}

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29.5),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:untitled/test/tests.dart';
// import 'package:untitled/Events/con_events/User/paper.dart';
// import 'package:untitled/HomeTest/dev.dart';
// import 'package:untitled/HomeScreen/homescreen.dart';
// import 'package:untitled/con_events/paper.dart';
// import 'package:untitled/login/login.dart';
// import 'package:untitled/test.dart';
// import 'package:untitled/test/logtest.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.orange),
//       debugShowCheckedModeBanner: false,
//       home: MyAppList(),
//     );
//   }
// }

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';

// import 'Screens/upload.dart';
// import 'navigation/navigation.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   await Firebase.initializeApp();

//   runApp(Upload());
// }

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(Navbar());
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firestore/open_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opening View Demo',
      routes: AppRoutes.define(),
      home: OpeningView(),
    );
  }
}

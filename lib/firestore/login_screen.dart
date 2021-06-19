import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'open_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  // ignore: override_on_non_overriding_member
  void checkverified(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot['verified'] == true) {
        Navigator.of(context).popAndPushNamed(AppRoutes.menu);
      } else {
        FirebaseAuth auth = FirebaseAuth.instance;
        String uid = auth.currentUser!.uid.toString();
        FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
          (DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              print("if passed");
              Navigator.of(context).pushNamed(AppRoutes.authVerify);
            } else {
              print("else passed");
              Fluttertoast.showToast(msg: 'Please Register');
            }
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    // void showAlertDialog(BuildContext context) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         TextEditingController _emailControllerField =
    //         TextEditingController();
    //         return CustomAlertDialog(
    //           content: Container(
    //             width: MediaQuery.of(context).size.width / 1.2,
    //             height: MediaQuery.of(context).size.height / 4.5,
    //             color: Colors.white,
    //             child: Column(
    //               children: <Widget>[
    //                 Text("Insert Reset Email:"),
    //                 TextField(
    //                   controller: _emailControllerField,
    //                   decoration: InputDecoration(
    //                     focusedBorder: UnderlineInputBorder(
    //                       borderSide: BorderSide(
    //                         color: Colors.black,
    //                       ),
    //                     ),
    //                     hintText: "something@example.com",
    //                     labelText: "Email",
    //                     labelStyle: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     hintStyle: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.all(15),
    //                   child: Material(
    //                     elevation: 5.0,
    //                     borderRadius: BorderRadius.circular(25.0),
    //                     color: Color(0xff8c52ff),
    //                     child: MaterialButton(
    //                       minWidth: mq.size.width / 2,
    //                       padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    //                       child: Text(
    //                         "Send Reset Email",
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                           fontSize: 20.0,
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       onPressed: () async {
    //                         try {
    //                           FirebaseAuth.instance.sendPasswordResetEmail(
    //                               email: _emailControllerField.text);
    //                           Navigator.of(context).pop();
    //                         } catch (e) {
    //                           print(e);
    //
    //                         }
    //                       },
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }

    final logo = Image.asset(
      "images/logo.png",
      height: mq.size.height / 4,
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "something@iare.ac.in",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: "password",
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: <Widget>[
        //     MaterialButton(
        //       onPressed: () {},
        //       child: Text(
        //         "Forgot Password",
        //         style: Theme.of(context)
        //             .textTheme
        //             .caption!
        //             .copyWith(color: Colors.black),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
          passwordField,
        ],
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xff4b4b87),
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          try {
            await Firebase.initializeApp();
            // ignore: unused_local_variable
            UserCredential user =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setString('email', _emailController.text);
            // Navigator.of(context).pushNamed(AppRoutes.menu);
            checkverified(context);
          } on FirebaseAuthException catch (e) {
            print("this is ${e.code}");
            if (e.code == 'wrong-password') {
              Fluttertoast.showToast(msg: "Enter the correct password");
            } else if (e.code == 'invalid-email') {
              Fluttertoast.showToast(msg: "Enter Correct Email Id");
            } else if (e.code == 'user-not-found') {
              Fluttertoast.showToast(
                  msg: "Account doesn't exist, Please Register");
            }
          } catch (e) {
            print("Error");
            print(e.toString());
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a member?",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.authRegister);
              },
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

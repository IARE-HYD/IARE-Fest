import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase.dart';
import 'open_screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _namevalidate = true;
  bool _passwordvalidate = true;
  bool _emailvalidate = true;
  bool _collegevalidate = true;
  bool _phonevalidate = true;
  bool _rollnovalidate = true;
  bool _departmentvalidate = true;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _rollnoController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  @override
  void initState() {
    _namevalidate = true;
    _passwordvalidate = true;
    _emailvalidate = true;
    _collegevalidate = true;
    _phonevalidate = true;
    _rollnovalidate = true;
    _departmentvalidate = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final usernameField = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: _nameController,
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
        hintText: "John Doe",
        labelText: "Name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _namevalidate ? null : 'Value Can\'t Be Empty',
      ),
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
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _emailvalidate ? null : 'Invalid Email',
      ),
    );

    final passwordField = TextFormField(
      validator: (value) {
        if (value!.length < 6) {
          return 'Please enter some text';
        }
        return null;
      },
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
        errorText: _passwordvalidate ? null : 'Value Can\'t Be less than 6',
      ),
    );

    final collegeField = TextFormField(
      obscureText: false,
      controller: _collegeController,
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
        hintText: "ex: Institute of Aeronautical Engineering",
        labelText: "Institution Name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _collegevalidate ? null : 'Value Can\'t Be Empty',
      ),
    );

    final phoneField = TextFormField(
      obscureText: false,
      controller: _phoneController,
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
        hintText: "ex: XXXXXXXXXX",
        labelText: "Mobile Number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText:
            _phonevalidate ? null : 'Value Can\'t Be less than 10 characters',
      ),
    );

    final rollnoField = TextFormField(
      obscureText: false,
      controller: _rollnoController,
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
        hintText: "ex: 18951A0501",
        labelText: "Roll Number",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText:
            _rollnovalidate ? null : 'Value Can\'t Be less than 10 characters',
      ),
    );

    final departmentField = TextFormField(
      key: _formKey,
      obscureText: false,
      controller: _departmentController,
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
        hintText: "ex: CSE",
        labelText: "Department",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: _departmentvalidate ? null : 'Value Can\'t Be Empty',
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Register',
              style: GoogleFonts.odibeeSans(fontSize: 40),
            ),
          ),
          usernameField,
          emailField,
          phoneField,
          collegeField,
          rollnoField,
          departmentField,
          passwordField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xff4b4b87),
      child: MaterialButton(
        minWidth: mq.size.width / 1.5,
        padding: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          setState(() {
            _departmentController.text.isEmpty
                ? _departmentvalidate = false
                : _departmentvalidate = true;
            _nameController.text.isEmpty
                ? _namevalidate = false
                : _namevalidate = true;
            _passwordController.text.length >= 6
                ? _passwordvalidate = true
                : _passwordvalidate = false;
            _phoneController.text.length == 10
                ? _phonevalidate = true
                : _phonevalidate = false;
            ((_emailController.text.contains('@gmail.com') ||
                        _emailController.text.contains('@iare.ac.in')) &&
                    (_emailController.text.length > 11))
                ? _emailvalidate = true
                : _emailvalidate = false;
            _rollnoController.text.length >= 6
                ? _rollnovalidate = true
                : _rollnovalidate = false;
            _collegeController.text.isEmpty
                ? _collegevalidate = false
                : _collegevalidate = true;
            // print("value is");
            // print(_passwordvalidate);
            // print(_departmentvalidate &&
            //     _namevalidate &&
            //     _passwordvalidate &&
            //     _phonevalidate &&
            //     _emailvalidate &&
            //     _rollnovalidate &&
            //     _collegevalidate);
          });
          print(_emailvalidate);
          if (_departmentvalidate &&
              _namevalidate &&
              _passwordvalidate &&
              _phonevalidate &&
              _emailvalidate &&
              _rollnovalidate &&
              _collegevalidate) {
            try {
              // print(_emailvalidate);
              // print(_departmentvalidate &&
              //     _namevalidate &&
              //     _passwordvalidate &&
              //     _phonevalidate &&
              //     _emailvalidate &&
              //     _rollnovalidate &&
              //     _collegevalidate);
              print('lol1');
              await Firebase.initializeApp();
              // Navigator.of(context).pushNamed(AppRoutes.authVerify);
              // ignore: unused_local_variable
              UserCredential user =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              User? updateUser = FirebaseAuth.instance.currentUser;
              updateUser!.updateProfile(displayName: _nameController.text);
              userSetup(
                  _nameController.text,
                  _passwordController.text,
                  _emailController.text,
                  _collegeController.text,
                  _departmentController.text,
                  _rollnoController.text,
                  _phoneController.text);
              FirebaseAuth auth = FirebaseAuth.instance;
              String uid = auth.currentUser!.uid.toString();
              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(uid)
                  .get()
                  .then(
                (DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists) {
                    print("if passed");
                    Navigator.of(context).pushNamed(AppRoutes.authVerify);
                  } else {
                    print("else passed");
                    Fluttertoast.showToast(
                        msg:
                            'Please wait 10 seconds and Click on Register again');
                  }
                },
              );
            } on FirebaseAuthException catch (e) {
              print(e.code);
              if (e.code == 'email-already-in-use') {
                Fluttertoast.showToast(
                    msg: "User already registered please login");
              }
              print("lol");
            } catch (e) {
              print(e.toString());
            }
          } else {
            print(_emailvalidate);
            if (_emailvalidate == false) {
              Fluttertoast.showToast(msg: "Enter a valid EmailId");
            } else if (_rollnovalidate == false) {
              Fluttertoast.showToast(msg: "Enter a valid Roll number");
            } else if (_phonevalidate == false) {
              Fluttertoast.showToast(msg: "Enter a valid phone number");
            } else if (_passwordvalidate == false) {
              Fluttertoast.showToast(msg: "Enter a valid password");
            } else if (_departmentvalidate == false) {
              Fluttertoast.showToast(msg: "Enter a valid department");
            } else {
              Fluttertoast.showToast(msg: "Please check your details");
            }
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(6.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.authLogin);
              },
              child: Text(
                "Login",
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  fields,
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

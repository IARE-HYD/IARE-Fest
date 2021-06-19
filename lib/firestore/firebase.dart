import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> userSetup(String displayName, String password, String email,
    String college, String dept, String year, String phone) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.doc(uid).set({
    'displayName': displayName,
    'uid': uid,
    'password': password,
    'email': email,
    'college': college,
    'dept': dept,
    'year': year,
    'phone': phone,
    'admin': false,
    'verified': false,
  });
  return;
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:loc/Const/diet_model.dart';

class Database {
  FirebaseAuth auth = FirebaseAuth.instance;
  final dietUrl = 'https://api-diet-hackathon.herokuapp.com/';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<Diet> fetchDiet() async {
  final response = await http
      .get(Uri.parse(dietUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Diet.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signup(String email, String name, String url) async {
    _firestore.collection("users").doc(email).set({
      "email": email,
      "name": name,
      "photoUrl": url,
      "events": [],
      "sports": [],
      "teams": [],
      "activity": [],
      "levelXp": 0,
      "streak":0
    });
  }

  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
  }

  Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return _doc.data();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<DocumentSnapshot> userStream(String? uid) {
    return _firestore.collection("users").doc(uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> leaderboardStream() {
    return _firestore
        .collection("users")
        .orderBy('levelXp', descending: true)
        .limit(10)
        .snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> sports() {
    return _firestore.collection("sports").get();
  }

  void debugLogs(String uid, String type, String trace) {
    _firestore
        .collection("users")
        .doc(uid)
        .collection("logs")
        .doc("${DateTime.now()} $type")
        .set({
      "type": type,
      "stacktrace": trace,
      "timestamp": DateTime.now(),
      "origin": "App"
    }).then((value) {
      //print(value.documentID);
    });
  }
}

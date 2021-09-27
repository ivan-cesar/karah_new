import 'package:flutter/foundation.dart';
import 'package:canteen_food_ordering_app/models/user.dart';
import 'package:commons/commons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  FirebaseUser _user;

  ProgressDialog pr;
  AuthenticationService(this._firebaseAuth);

  Stream<FirebaseUser> get authStateChanges => _firebaseAuth.onAuthStateChanged;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  FirebaseUser get user {
    return _user;
  }
  Future<String> signIn(
      {String email, String password, BuildContext context}) async {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
    pr.show();
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        // complexeStuff(email: email, context: context);
      });

      return "${_firebaseAuth.currentUser}";
    } on AuthException catch (e) {
      pr.hide().then((value) {
        print(value);
        errorDialog(context, "Erreur d'authentification");
      });
      return e.message;
    }
  }

  // void complexeStuff({String email, BuildContext context}) {
  //   FirebaseMessaging.instance.getToken().then((token) async {
  //     QuerySnapshot data = await FirebaseFirestore.instance
  //         .collection("ActeDemand")
  //         .where('email', isEqualTo: email)
  //         .get();
  //     String value = "";
  //     data.docs.forEach((element) {
  //       value = element.data()['key'];
  //     });
  //     print(value);
  //     if (value != null) {
  //       var snapshot = FirebaseFirestore.instance
  //           .collection("ActeDemand")
  //           .doc(value)
  //           .snapshots();
  //       await snapshot.forEach((element) {
  //         element.reference.update({'deviceId': token});
  //       });
  //     }
  //     await FirebaseFirestore.instance
  //         .collection("Profile")
  //         .doc('${_firebaseAuth.currentUser.uid}')
  //         .update({'token': token});
  //     DocumentSnapshot document = await FirebaseFirestore.instance
  //         .collection('Profile')
  //         .doc(_firebaseAuth.currentUser.uid)
  //         .get();
  //
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     sharedPreferences.setString('matricule', document.data()['matricule']);
  //     sharedPreferences.setString('nom', document.data()['nom']);
  //     sharedPreferences.setString('tel', document.data()['tel']);
  //     sharedPreferences.setString('email', document.data()['email']);
  //     sharedPreferences.setString(
  //         'priseDeService', document.data()['priseDeService']);
  //     sharedPreferences.setString('fonction', document.data()['fonction']);
  //   });
  //   pr.hide().then((value) {
  //     print(value);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => MyApp()));
  //   });
  // }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "New user created";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  // Test
  User _userDetails;

  User get userDetails => _userDetails;

  setUserDetails(User user) {
    _userDetails = user;
   // notifyListeners();
  }
}

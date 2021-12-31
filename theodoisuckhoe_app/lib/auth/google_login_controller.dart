
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:theodoisuckhoe_app/screens/page/index.dart';


class GoogleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login(BuildContext context) async {
    this.googleAccount = await _googleSignIn.signIn();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => MyHomePage()),
            (route) => false);
    notifyListeners();
  }

  logOut() async {
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorHandle {
  void handleAuthErrors(FirebaseAuthException e, BuildContext context) {
    if (e.code == 'wrong-password') {
      awesomeDialog(context, 'wrong-password ');
    } else if (e.code == 'invalid-email') {
      awesomeDialog(context, 'Invalid email');
    } else if (e.code == 'weak-password') {
      awesomeDialog(context, 'Weak password');
    } else if (e.code == 'email-already-in-use') {
      awesomeDialog(context, 'email already in use');
    } else {
      awesomeDialog(context, 'Your email or password is wrong');
    }
  }

static   Future<Widget> awesomeDialog(context, title) async {
    return await AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
}

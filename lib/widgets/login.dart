import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService {
  String? verificationcode;
  verifyPhoneNumber(String phoneNo, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Navigator.pushNamed(context, 'ChangePassword');
        print("done");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        resendToken = resendToken;
        verificationcode = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationcode!;
      },
      timeout: const Duration(seconds: 0),
    );
  }
}

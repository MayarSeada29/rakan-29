import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakna/pages/Privacy_policey_page.dart';
import 'package:rakna/pages/change_password.dart';
import 'package:rakna/pages/dashboard_page.dart';
import 'package:rakna/pages/forgot_password.dart';
import 'package:rakna/pages/login_page.dart';
import 'package:rakna/pages/password_confirmed_page.dart';
import 'package:rakna/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rakna/pages/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //To ensure that everything await is initialized before the application is executed
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Rakna());
}

class Rakna extends StatefulWidget {
  const Rakna({super.key});

  @override
  State<Rakna> createState() => _RaknaState();
}

class _RaknaState extends State<Rakna> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('========User is currently signed out!');
      } else {
        print('========User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: {
        PrivacyPoliceyPage.id: (context) => const PrivacyPoliceyPage(),
        SginUp.id: (context) => SginUp(),
        Splash_Screen.id: (context) => const Splash_Screen(),
        PasswordConfirmedPage.id: (context) => const PasswordConfirmedPage(),
        LoginPage.id: (context) => const LoginPage(),
        ChangePassword.id: (context) => const ChangePassword(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        LoginPage.id: (context) => const LoginPage(),
        // OtpPage.id: (context) => const OtpPage(
        //       phone: '',
        //     ),
        PasswordConfirmedPage.id: (context) => const PasswordConfirmedPage(),
        DashBordPage.id: (context) => const DashBordPage(),
      },
      initialRoute: Splash_Screen.id,
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakna/constants.dart';
import 'package:rakna/custom_text_field.dart';
import 'package:rakna/pages/dashboard_page.dart';
import 'package:rakna/pages/forgot_password.dart';
import 'package:rakna/widgets/custom_button.dart';
import 'package:rakna/widgets/custom_container.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPag';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading = false;
  bool _obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  Future<void> signInWithGoogle() async {
    // GoogleSignInAccount
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to DashBordPage
      Navigator.pushReplacementNamed(context, "DashBordPage");
    } catch (e) {
      // Handle the sign-in error
      print("Error signing in with Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              right: -500,
              top: -300,
              bottom: 530,
              child: Image.asset(
                'assets/page-1/images/subtract.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(1), // إضافة Gap هنا
                    const SizedBox(
                      height: 130,
                    ),
                    Center(
                      child: Image.asset(
                        kLogin,
                        height: 100,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email address',
                      style: TextStyle(color: kPrimaryColorText, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "E-mail address",
                      suffixWidget: const Icon(
                        Icons.email_rounded,
                        color: Color(
                          0xffF8A00E,
                        ),
                      ),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your e-mail address";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(color: kPrimaryColorText, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "Enter your password",
                      isPassword: true,
                      maxLines: 1,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your password";
                        }

                        return null;
                      },
                      // onValidate: (value) {
                      //   if (value == null || value.trim().isEmpty) {
                      //     return "you must enter your password !";
                      //   }

                      //   var regex = RegExp(
                      //       r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                      //   if (!regex.hasMatch(value)) {
                      //     return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 6 characters long.";
                      //   }

                      //   return null;
                      // },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ForgotPassword.id,
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: kPrimaryColorText, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtonKm(
                      text: 'Sign In',
                      // onTap: () {
                      //   if (formKey.currentState!.validate()) {
                      //     FirebaseUtils()
                      //         .signIN(
                      //             emailController.text, passwordController.text)
                      //         .then(
                      //       (value) {
                      //         if (value) {
                      //           // SnackBarService.showSuccessMessage(
                      //           //     "Your logged in successfully");
                      //           Navigator.pushNamedAndRemoveUntil(
                      //             context,
                      //             DashBordPage.id,
                      //             (route) => false,
                      //           );
                      //         }
                      //       },
                      //     );
                      //   }
                      // },
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          //signInWithEmailAndPassword
                          try {
                            final Credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                            Navigator.pushReplacementNamed(
                              context,
                              "DashBordPage",
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email');

                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Dialog Title',
                                desc: 'Wrong password provided for that user.',
                              ).show();

                              print('Wrong password provided for that user.');

                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Dialog Title',
                                desc: 'Wrong password provided for that user.',
                              ).show();
                            }
                          }
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, DashBordPage.id,
                                arguments: email);
                          } on FirebaseException catch (ex) {
                            if (ex.code == 'user-not-found') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                  context, 'No user found for that email.');
                            } else if (ex.code == 'wrong-password') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                  context, "No user found for that email.");
                            }
                          } catch (ex) {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                    ),
                    const SizedBox(
                      height: 10,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in with',
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 93, 93),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const containerIcons(
                          height: 60,
                          width: 60,
                          decorationColor: Color(0xff454545),
                          borderColor: kPrimaryColorText,
                          asset: 'assets/page-1/images/vector.png',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const containerIcons(
                          height: 60,
                          width: 60,
                          decorationColor: Color(0xff454545),
                          borderColor: kPrimaryColorText,
                          asset: 'assets/page-1/images/apple.png',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            signInWithGoogle();
                          },
                          child: const containerIcons(
                            height: 60,
                            width: 60,
                            decorationColor: Color(0xff454545),
                            borderColor: kPrimaryColorText,
                            asset: 'assets/page-1/images/google.png',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'dont have an account ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'SginUp');
                          },
                          child: const Text(
                            '  Sign Up',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
//flutter run --debug
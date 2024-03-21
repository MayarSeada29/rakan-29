import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakna/constants.dart';
import 'package:rakna/custom_text_field.dart';
import 'package:rakna/pages/dashboard_page.dart';
import 'package:rakna/pages/otp_page.dart';
import 'package:rakna/widgets/custom_button.dart';

import 'package:gap/gap.dart';
import 'package:rakna/widgets/login.dart';

class SginUp extends StatefulWidget {
  static const String id = "SginUp";

  const SginUp({super.key});

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  bool agreeToTerms = false;
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var vm = Provider.of<SettingsProvider>(context);

    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/page-1/images/signup.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          //padding:for all UI from
          //left=20
          // and
          // right=15
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.height * 0.17),
                  const Padding(
                    padding: EdgeInsets.only(
                      //padding:for Sign UP Text
                      //left=20
                      // and

                      left: 20,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: "AgencyFB",
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'create an account to continue!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Actor"),
                    ),
                  ),
                  const Gap(10),

                  Text(
                    "Full Name",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: kPrimaryColorText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(2),
                  //? Name Logic//
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    hint: "Enter your full name",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.person,
                      color: Color(0xffF8A00E),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "E-mail",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: kPrimaryColorText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(2),
                  //? e-mail Logic//
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.email_rounded,
                      color: Color(0xffF8A00E),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your e-mail address";
                      }

                      var regex = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                      if (!regex.hasMatch(value)) {
                        return "Invalid e-mail address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Phone Number",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: kPrimaryColorText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(2),
                  CustomTextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    hint: "Enter your PhoneNumber",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.phone,
                      color: Color(0xffF8A00E),
                    ), //? PhoneNumber Logic//
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your Phone Number";
                      } else if (value.length != 11) {
                        return "Mobile Number must be of 11 digit !";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //!for Password //
                  // isPassword: true,
                  // maxLines: 1,
                  // onValidate: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return "you must enter your password !";
                  //   }

                  //   var regex = RegExp(
                  //       r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.//n])(?=.*[A-Z])(?=.*[a-z]).*$");

                  //   if (!regex.hasMatch(value)) {
                  //     return "The password must include at least /n* one lowercase letter, /n* one uppercase letter, /n* one digit, /n* one special character,/n* at least 6 characters long.";
                  //   }

                  //   return null;
                  // },

                  // var regex = RegExp(
                  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                  // if (!regex.hasMatch(value)) {
                  //   return "The password must include at least /n* one lowercase letter, /n* one uppercase letter, /n* one digit, /n* one special character,/n* at least 6 characters long.";
                  // }

                  // const SizedBox(height: 20),
                  // Text(
                  //   "Confirm Password",
                  //   textAlign: TextAlign.start,
                  //   style: theme.textTheme.bodyMedium?.copyWith(
                  //     color: kPrimaryColorText,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // const Gap(10),
                  ////!for confirm password //
                  // CustomTextField(
                  //   controller: confirmPasswordController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   hint: "Enter your password",
                  //   hintColor: const Color(0xff606060),
                  //   isPassword: true,
                  //   maxLines: 1,
                  //   onValidate: (value) {
                  //     if (value == null || value.trim().isEmpty) {
                  //       return "you must enter your password !";
                  //     }

                  //     if (value != passwordController.text) {
                  //       return "password not matching";
                  //     }

                  //     return null;
                  //   },
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: kPrimaryColorText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(2),
                  CustomTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your password",
                    hintColor: const Color(0xff606060),
                    isPassword: true,
                    maxLines: 1,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password !";
                      }

                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                      if (!regex.hasMatch(value)) {
                        return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 6 characters long.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(
                            () {
                              agreeToTerms = value!;
                            },
                          );
                        },
                      ),
                      const Text(
                        'I agree to the terms of service and ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bebas',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'PrivacyPoliceyPage',
                          );
                        },
                        child: const Text(
                          'privacy police',
                          style: TextStyle(
                            color: Color(0xFF4D97F6),
                            fontFamily: 'Bebas',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(7),
                  CustomButtonKm(
                    text: "Sign Up",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        //createUserWithEmailAndPassword
                        try {
                          final Credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            //   AwesomeDialog(
                            //   context: context,
                            //   dialogType: DialogType.error,
                            //   animType: AnimType.rightSlide,
                            //   title: 'Dialog Title',
                            //   desc: 'The password provided is too weak',
                            //  ).show();
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            //   AwesomeDialog(
                            //   context: context,
                            //   dialogType: DialogType.error,
                            //   animType: AnimType.rightSlide,
                            //   title: 'Dialog Title',
                            //   desc: 'The account already exists for that email.',
                            //  ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                      // Navigator.pushReplacementNamed(context, "DashBordPage");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return const DashBordPage();
                      //   }),
                      // );
                    },
                  ),

                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have Account? ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          ' Sign In.',
                          style: TextStyle(
                            color: Color(0xFF5C96FF),
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                          ),
                        ),
                      )
                    ],
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

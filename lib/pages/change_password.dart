import 'package:flutter/material.dart';

import 'package:rakna/constants.dart';
import 'package:rakna/custom_text_field.dart';
import 'package:rakna/widgets/custom_button.dart';
import 'package:rakna/widgets/custom_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static String id = 'ChangePassword';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String? password;
  String? confirmPassword;
  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/page-1/images/img-6tC.png',
                  height: 250,
                  width: 250,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    Text(
                      'Enter Password',
                      style: TextStyle(
                        color: kPrimaryColorText,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Please type something you remember',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'New Password',
                        style: TextStyle(
                          color: kPrimaryColorText,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                // style: theme.textTheme.bodyMedium?.copyWith(
                //   color: Colors.black,
                //   fontWeight: FontWeight.w500,
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your password",
                    hintColor: Colors.black87,
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
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: kPrimaryColorText,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your password",
                    hintColor: Colors.black87,
                    isPassword: true,
                    maxLines: 1,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password !";
                      }

                      if (value != passwordController.text) {
                        return "password not matching";
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // const SizedBox(
                //   height: 5,
                // ),
                // CustomFormTextField(
                //   onChanged: (data) {
                //     password = data;
                //   },
                //   hintText: 'Repeat Password',
                // ),
                // const SizedBox(
                //   height: 40,
                // ),
                CustomButtonKm(
                  text: 'Confirm Password',
                  onTap: () {
                    Navigator.pushNamed(context, 'LoginPag');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

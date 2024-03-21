// import 'package:flutter/material.dart';

// import 'package:rakna/constants.dart';
// import 'package:rakna/widgets/controller.dart';
// import 'package:rakna/widgets/custom_button.dart';
// import 'package:rakna/widgets/custom_filed_container.dart';
// import 'package:rakna/widgets/login.dart';

// class OtpPage extends StatefulWidget {
//   const OtpPage({required this.phone, super.key});
//   final String? phone;
//   static String id = 'OtpPage';
//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   GlobalKey<FormState> formKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       body: Form(
//         key: formKey,
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'assets/page-1/images/illustration.png',
//                     height: 340,
//                   ),
//                   const Text(
//                     'OTP VERIFICATION',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Text(
//                           'Enter the OTP sent to',
//                           style: TextStyle(
//                               color: kPrimaryColorText,
//                               fontSize: 20,
//                               fontFamily: 'Inria Sans'),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 20),
//                         child: Text(
//                           ' ${widget.phone}',
//                           style: const TextStyle(
//                               color: Colors.green,
//                               fontSize: 20,
//                               fontFamily: 'Inria Sans'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c1,
//                           first: true,
//                           last: false,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c2,
//                           first: false,
//                           last: false,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c3,
//                           first: false,
//                           last: false,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c4,
//                           first: false,
//                           last: false,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c5,
//                           first: false,
//                           last: false,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: TextFieldOTP(
//                           controller: c6,
//                           first: false,
//                           last: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Text(
//                           'Dont receive code ?',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 20),
//                         child: Text(
//                           ' Re-send',
//                           style: TextStyle(
//                             color: kPrimaryColorText,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   CustomButtonKm(
//                     text: 'Submit',
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         String smsCode = c1.text +
//                             c2.text +
//                             c3.text +
//                             c4.text +
//                             c5.text +
//                             c6.text;
//                         LoginService().verificationcode = smsCode;
//                         LoginService()
//                             .verifyPhoneNumber("${widget.phone}", context);
//                         Navigator.pushReplacementNamed(
//                             context, 'ChangePassword');
//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

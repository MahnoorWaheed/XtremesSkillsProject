// // import 'package:flutter/material.dart';

// // class OtpScreen extends StatefulWidget {
// //   const OtpScreen({ Key? key }) : super(key: key);

// //   @override
// //   State<OtpScreen> createState() => _OtpScreenState();
// // }

// // class _OtpScreenState extends State<OtpScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //        resizeToAvoidBottomInset: false,
// //       backgroundColor: Color(0xfff7f6fb),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
// //           child: Column(
// //             children: [
// //               Align(
// //                 alignment: Alignment.topLeft,
// //                 child: GestureDetector(
// //                   onTap: () => Navigator.pop(context),
// //                   child: Icon(
// //                     Icons.arrow_back,
// //                     size: 32,
// //                     color: Colors.black54,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 18,
// //               ),
// //               Container(
// //                 width: 200,
// //                 height: 200,
// //                 decoration: BoxDecoration(
// //                   color: Colors.deepPurple.shade50,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: Image.asset(
// //                   'assets/password.svg',
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 24,
// //               ),
// //               Text(
// //                 'Verification',
// //                 style: TextStyle(
// //                   fontSize: 22,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 10,
// //               ),
// //               Text(
// //                 "Enter your OTP code number",
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black38,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //               SizedBox(
// //                 height: 28,
// //               ),
// //               Container(
// //                 padding: EdgeInsets.all(18),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         _textFieldOTP(first: true, last: false),
// //                         _textFieldOTP(first: false, last: false),
// //                         _textFieldOTP(first: false, last: false),
// //                         _textFieldOTP(first: false, last: true),
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: 22,
// //                     ),
// //                     SizedBox(
// //                       width: double.infinity,
// //                       child: ElevatedButton(
// //                         onPressed: () {},
// //                         style: ButtonStyle(
// //                           foregroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.white),
// //                           backgroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.purple),
// //                           shape:
// //                               MaterialStateProperty.all<RoundedRectangleBorder>(
// //                             RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(24.0),
// //                             ),
// //                           ),
// //                         ),
// //                         child: Padding(
// //                           padding: EdgeInsets.all(14.0),
// //                           child: Text(
// //                             'Verify',
// //                             style: TextStyle(fontSize: 16),
// //                           ),
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 18,
// //               ),
// //               Text(
// //                 "Didn't you receive any code?",
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black38,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //               SizedBox(
// //                 height: 18,
// //               ),
// //               Text(
// //                 "Resend New Code",
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.purple,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //   Widget _textFieldOTP({ bool? first, last}) {
// //     return Container(
// //       height: 40,
// //       child: AspectRatio(
// //         aspectRatio: 1.0,
// //         child: TextField(
// //           autofocus: true,
// //           onChanged: (value) {
// //             if (value.length == 1 && last == false) {
// //               FocusScope.of(context).nextFocus();
// //             }
// //             if (value.length == 0 && first == false) {
// //               FocusScope.of(context).previousFocus();
// //             }
// //           },
// //           showCursor: false,
// //           readOnly: false,
// //           textAlign: TextAlign.center,
// //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //           keyboardType: TextInputType.number,
// //           maxLength: 1,
// //           decoration: InputDecoration(
// //             counter: Offstage(),
// //             enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(width: 2, color: Colors.black12),
// //                 borderRadius: BorderRadius.circular(12)),
// //             focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(width: 2, color: Colors.purple),
// //                 borderRadius: BorderRadius.circular(12)),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:xtremes_skills/modules/login_otp/controller/auth_service.dart';
// import 'package:xtremes_skills/modules/login_otp/screen/home_page.dart';
// import 'package:xtremes_skills/utils/utils.dart';

// class PhoneAuthPage extends StatefulWidget {

//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }

// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController phoneNumber = TextEditingController();
//   TextEditingController otpCode = TextEditingController();

//   OutlineInputBorder border = OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.white, width: 3.0));

//   bool isLoading = false;

//   String? verificationId;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Verify OTP"),
//                 backwardsCompatibility: false,
//           systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),),
//       backgroundColor: Colors.white,
//       body:  Center(
//         child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: screenWidth(context)*0.8,
//                     child: TextFormField(
//                         keyboardType: TextInputType.phone,
//                         controller: phoneNumber,
//                         decoration: InputDecoration(
//                           labelText: "Enter Phone",
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 15.0, horizontal: 10.0),
//                           border: border,
//                         )),
//                   ),
//                   SizedBox(
//                     height: screenHeight(context)*0.01,
//                   ),
//                   SizedBox(
//                     width: screenWidth(context)*0.8,
//                     child: TextFormField(
//                       keyboardType: TextInputType.number,
//                       controller: otpCode,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "Enter Otp",
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 15.0, horizontal: 10.0),
//                         border: border,
//                         suffixIcon: Padding(
//                           child: FaIcon(
//                             FontAwesomeIcons.eye,
//                             size: 15,
//                           ),
//                           padding: EdgeInsets.only(top: 15, left: 15),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(bottom: screenHeight(context)*0.05)),
//                   !isLoading
//                       ? SizedBox(
//                           width: screenWidth(context)*0.8,
//                           child: OutlinedButton(
//                             onPressed: () async {
                              
//                               // FirebaseService service = new FirebaseService();
//                               if (_formKey.currentState!.validate()) {
//                                 setState(() {
//                                   isLoading = true;
//                                 });
//                                 await phoneSignIn(phoneNumber: phoneNumber.text);
//                               }
//                             },
//                             child: Text("Constants.textSignIn"),
//                             style: ButtonStyle(
//                                 foregroundColor: MaterialStateProperty.all<Color>(
//                                     Colors.red),
//                                 backgroundColor: MaterialStateProperty.all<Color>(
//                                     Colors.blue),
//                                 side: MaterialStateProperty.all<BorderSide>(
//                                     BorderSide.none)),
//                           ),
//                         )
//                       : CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//       ),
//     );
//   }

//   Future<void> phoneSignIn({required String phoneNumber}) async {
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: _onVerificationCompleted,
//         verificationFailed: _onVerificationFailed,
//         codeSent: _onCodeSent,
//         codeAutoRetrievalTimeout: _onCodeTimeout);
//   }

//   _onVerificationCompleted(PhoneAuthCredential authCredential) async {
//     print("verification completed ${authCredential.smsCode}");
//     User? user = FirebaseAuth.instance.currentUser;
//     setState(() {
//           this.otpCode.text = authCredential.smsCode!;
//         });
//     if (authCredential.smsCode != null) {
//       try{
//       UserCredential credential =
//           await user!.linkWithCredential(authCredential);
//       }on FirebaseAuthException catch(e){
//           if(e.code == 'provider-already-linked'){
//             await _auth.signInWithCredential(authCredential);
//           }
//       }  
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=>HomePage()), (route) => false);
//       // Navigator.pushNamedAndRemoveUntil(
//       //     context, Constants.homeNavigate, (route) => false
//       //     );
//     }
//   }

//   _onVerificationFailed(FirebaseAuthException exception) {
//     if (exception.code == 'invalid-phone-number') {
//       showMessage("The phone number entered is invalid!");
//     }
//   }
//   _onCodeSent(String verificationId, int? forceResendingToken) {
//     this.verificationId = verificationId;
//     print(forceResendingToken);
//     print("code sent");
//   }

//   _onCodeTimeout(String timeout) {
//     return null;
//   }

//   void showMessage(String errorMessage) {
//     showDialog(
//         context: context,
//         builder: (BuildContext builderContext) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text(errorMessage),
//             actions: [
//               TextButton(
//                 child: Text("Ok"),
//                 onPressed: () async {
//                   Navigator.of(builderContext).pop();
//                 },
//               )
//             ],
//           );
//         }).then((value) {
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }

// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await _auth.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}

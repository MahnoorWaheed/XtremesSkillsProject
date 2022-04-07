import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';

class OTPControllerScreen extends StatefulWidget {
  final String phone;
 final String codedigits;
  const OTPControllerScreen({ required this.codedigits, required this.phone});

  @override
  State<OTPControllerScreen> createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPController =TextEditingController();
  final FocusNode _pinOTPCodeFocus =FocusNode();
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  String? verificationCode;

    FirebaseAuth _auth = FirebaseAuth.instance;
  String? dialCodeDigit ="+00";

  String? verificationId;

  bool showLoading = false;
  int? forceResendingToken;

  final BoxDecoration pinOTPCodeDecoration= BoxDecoration(
    color: Colors.blue,
    border: Border.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  );

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhoneNumber();

  }

verifyPhoneNumber()async{
await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber:" ${widget.codedigits + widget.phone}",
            timeout: const Duration(seconds: 60),
              verificationCompleted: (phoneAuthCredential) async {
                await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then((value) async {
            if(value.user!=null) {
                String? usertoken = await FirebaseMessaging.instance.getToken();
         _firestore.collection('user').doc(FirebaseAuth.instance.currentUser?.email).set({

      

            'user_phone':widget.phone,
            'userFCM_token': usertoken
         });
                    Navigator.of(context).push(MaterialPageRoute(builder: (c)=> DasboardUser()));
                  }
                });
            
              },
              verificationFailed: (verificationFailed) async {
                
                ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(verificationFailed.message.toString())));
              },
              codeSent: (verificationId, resendingToken)  {
                setState(() {
                  verificationCode=verificationId;
                  
                });
              },
              codeAutoRetrievalTimeout: (verificationId) {
                setState(() {
                  verificationCode=verificationId;
                });
              },
              
            );
            
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/password.svg", 
          height: MediaQuery.of(context).size.height*0.25,
          ),
          ),
      
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
              onTap: (){
         verifyPhoneNumber();
              },
              child: Text("verify:  ${widget.codedigits}-${widget.phone}"),
            )),
          ),
          Padding(padding: EdgeInsets.all(40.0), 
          child: Pinput(
            length: 6,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            readOnly: true,
            pinAnimationType: PinAnimationType.rotation,
            focusNode: _pinOTPCodeFocus,
            controller: _pinOTPController,
            onTap: () async{
              String? pin;
              try{
                
                PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationCode!, smsCode: pin!);
setState(() {
                  showLoading=true;
                });
            signInWithPhoneAuthCredential(phoneAuthCredential);
                // await FirebaseAuth.instance.signInWithCredential(
                //   PhoneAuthProvider.credential(
                //   verificationId: verificationCode!, smsCode: pin)
                //   ).then((value) 
                //   {
                //     if(value.user!=null){
                //       Navigator.of(context).push(MaterialPageRoute(builder: (c)=> DasboardUser()));
                //     }
                //   } 
                  
                //   );
              }
              catch(e){
                FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${"Invalid OTP"}")));
              }
            },
            // onSubmitted: (pin)async{
            //   try{
            //     PhoneAuthCredential phoneAuthCredential =
            //     PhoneAuthProvider.credential(
            //         verificationId: verificationCode!, smsCode: pin);

            // signInWithPhoneAuthCredential(phoneAuthCredential);
            //     // await FirebaseAuth.instance.signInWithCredential(
            //     //   PhoneAuthProvider.credential(
            //     //   verificationId: verificationCode!, smsCode: pin)
            //     //   ).then((value) 
            //     //   {
            //     //     if(value.user!=null){
            //     //       Navigator.of(context).push(MaterialPageRoute(builder: (c)=> DasboardUser()));
            //     //     }
            //     //   } 
                  
            //     //   );
            //   }
            //   catch(e){
            //     FocusScope.of(context).unfocus();
            //         ScaffoldMessenger.of(context)
            // .showSnackBar(SnackBar(content: Text("${"Invalid OTP"}")));
            //   }
            // },
          ),
          )
        ]),
      ),
    );
  }

    void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try { 
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = true;
      });

      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DasboardUser()));
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  // Future<String> login({
  //     required String phoneNumber,
      
  //   }) async{
  //     log('call to login');
  //     String res ="some error occured";
  //     try{
  //       await _auth.signInWithPhoneNumber(phoneNumber).then((value) async{
  //            SharedPreferences prefs= await SharedPreferences.getInstance();
  //            prefs.setString('phoneNumber', phoneNumber);
             
  //       });
  //       res="success";
  //     }
  //     catch(err){
  //       res=err.toString();

  //     }
  //     return res;
  //   }
}
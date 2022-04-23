import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/login_otp/controller/otp_controller.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';
import 'package:xtremes_skills/modules/login_otp/screen/registration.dart';


enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




// Assign widget based on availability of currentUser


  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
    

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController= TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? dialCodeDigit ="+92";

  String? verificationId;

  bool showLoading = false;
  int? forceResendingToken;
  var number='';

  getDoc() async{
   var a = await FirebaseFirestore.instance.collection('PhoneNumber').doc(phoneController.text).get();
   if(a.exists){
     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>OTPControllerScreen(
              phone: phoneController.text,
              codedigits: dialCodeDigit.toString(),
            )));
     print('Exists');
     return a;
   }
   if(!a.exists){
     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserRegistration(
              phone: phoneController.text,
              code: dialCodeDigit.toString(),
            )));
     print('Not exists');
     return null;
   }

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
        showLoading = false;
      });

      if(authCredential.user != null){

         

        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
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

  getMobileFormWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // const Spacer(),
            Text("Welcome",
            style: GoogleFonts.poppins(
              fontSize: 30, 
              fontWeight:FontWeight.bold,
            ),
            ),
             SizedBox(height: 30,),
            SvgPicture.asset("assets/phone.svg", 
            height: MediaQuery.of(context).size.height*0.2,
            fit: BoxFit.contain,
            ),
            SizedBox(height: 30,),
             Text("Please enter your Mobile Number to\nLOGIN or to REGISTER your account.", 
             style: GoogleFonts.poppins(
               fontSize: 16,
               
             ),
             
             ),
             Container(
               width: 400,
               height: 60,
              //  color: Colors.red,
               child: CountryCodePicker(
                 onChanged: (country){
                   setState(() {
                     dialCodeDigit = country.dialCode;
                   });
                 },
                 initialSelection: "pk",
                 
                 showCountryOnly: false,
                 showOnlyCountryWhenClosed: false,
                 favorite: ["+1", "US", "+92", "Pak"],
               ),
             ),
             Container(
 child:  TextFormField(
             controller: phoneController,
                          keyboardType: TextInputType.phone,
                          
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.black38, 
                              fontSize: 15
                            ),
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(dialCodeDigit!),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            
                          ),
                          maxLength: 12,
                        ),
             ),
        
                        
            ElevatedButton(
              onPressed: () async {
               
                // await FirebaseFirestore.instance.collection('PhoneNumber').doc(phoneController.text).get();
                // log('success');
                final snapShot = await FirebaseFirestore.instance.collection('customer').doc('+92'+phoneController.text).get();

   if (snapShot.exists){
            // Document already exists
             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>OTPControllerScreen(
                  phone: phoneController.text,
                  codedigits: dialCodeDigit.toString(),
                )));
            log('exists');
   }
   else{
            // Document doesn't exist
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserRegistration(
                  phone: phoneController.text,
                  code: dialCodeDigit.toString(),
                )));
            log('not exists');
   }

              
               
                
              },
              child: const Text("SEND"),
              // color: Colors.blue,
              // textColor: Colors.white,
            ),
            // Spacer(),
          ],
        ),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("ENTER YOUR OTP",
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        ),
        // SvgPicture.asset("assets/password.svg",
        // height: MediaQuery.of(context).size.height*0.25,
        // ),
        TextFormField(
         controller: otpController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        
                      ),
                    ),
        
        // SizedBox(
        //   height: 16,
        // ),
        ElevatedButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId.toString(), smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
         
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Container(
              child: showLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? getMobileFormWidget(context)
                      : getOtpFormWidget(context),
              padding: const EdgeInsets.all(16),
            ),
          )),
    );
  }
}

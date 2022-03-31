import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/login_otp/controller/otp_controller.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';


enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController= TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? dialCodeDigit ="+00";

  String? verificationId;

  bool showLoading = false;
  int? forceResendingToken;

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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // const Spacer(),
        Text("Registration",
        style: GoogleFonts.poppins(
          fontSize: 25, 
          fontWeight:FontWeight.bold,
        ),
        ),
        SvgPicture.asset("assets/phone.svg", 
        height: MediaQuery.of(context).size.height*0.2,
        fit: BoxFit.contain,
        ),
         Text("Add Phone Number to Verify you are not a Robot", 
         style: GoogleFonts.poppins(
           fontSize: 14,
           
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
             initialSelection: "IT",
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
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>OTPControllerScreen(
              phone: phoneController.text,
              codedigits: dialCodeDigit.toString(),
            )));
            
          },
          child: const Text("SEND"),
          // color: Colors.blue,
          // textColor: Colors.white,
        ),
        // Spacer(),
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
          body: Container(
            child: showLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                    ? getMobileFormWidget(context)
                    : getOtpFormWidget(context),
            padding: const EdgeInsets.all(16),
          )),
    );
  }
}

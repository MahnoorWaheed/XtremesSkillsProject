import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/otp_controller.dart';
class UserRegistration extends StatefulWidget {
  final String phone;
  final String code;
  const UserRegistration({required this.phone,required this.code, key }) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  final TextEditingController name=TextEditingController();

  void storename({
    required String name,
  }){
    firestore.collection('customer').doc('+92'+widget.phone).set({
       'name': name,
        'number':'+92'+widget.phone
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            // const Spacer(),
            Text("Registration",
            style: GoogleFonts.poppins(
              fontSize: 30, 
              fontWeight:FontWeight.bold,
            ),
            ),
            SvgPicture.asset("assets/phone.svg", 
            height: MediaQuery.of(context).size.height*0.2,
            fit: BoxFit.contain,
            ),
             Text("Please enter your full name to register \nyourself",
             textAlign: TextAlign.center,
              
             style: GoogleFonts.poppins(
               fontSize: 16,
               
               
             ),
             
             ),
       
             Container(
     child:  TextFormField(
       controller: name,
             
                          keyboardType: TextInputType.text,
   
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Full Name",
                            hintStyle: const TextStyle(
                              color: Colors.black38, 
                              fontSize: 15
                            ),
                            
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            
                          ),
                          
                        ),
             ),
      
                        
            ElevatedButton(
              onPressed: () async {
                 
                   storename(name: name.text);
                log(widget.phone);
                log(widget.code);
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>OTPControllerScreen(
                  phone: widget.phone,
                  codedigits: widget.code,
                )
                )
                );
                
              },
              child: const Text("SEND"),
              // color: Colors.blue,
              // textColor: Colors.white,
            ),
            // Spacer(),
          ],
      ),
        ),
      ),
    );
  }

 
}
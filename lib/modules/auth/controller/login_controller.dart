import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class LoginController extends GetxController{
//   bool isLoading= false;
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//    GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   TextEditingController eml = TextEditingController(); 
//    TextEditingController pass = TextEditingController(); 


//     void dispose(){
//       eml.clear();
//       pass.clear();
//     }


//      Future<String> login({
//       required String email,
//       required String password,
//     }) async{
//       log('call to login');
//       String res ="some error occured";
//       try{
//         await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
//              SharedPreferences prefs= await SharedPreferences.getInstance();
//              prefs.setString('email', email);
             
             
//         });
//         res="success";
//       }
//       catch(err){
//         res=err.toString();

//       }
//       return res;
//     }
    

// }
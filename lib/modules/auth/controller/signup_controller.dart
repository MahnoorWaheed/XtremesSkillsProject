import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignupController extends GetxController{
  bool isLoading =false;
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore= FirebaseFirestore.instance;
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    DateTime dateOfBirth = DateTime.now();
    
  
  Color bulbColor = Colors.black;

  String selectcity = 'Select City';

  String confirmpass='';

  String selectedday = 'Day';
  String selectedmonth = 'Month';
  String selectedyear = 'Year';

  String data = 'Male';
  // String? _email, _password;

   TextEditingController firstname = TextEditingController();
   TextEditingController lastname = TextEditingController(); 
   TextEditingController cnic = TextEditingController(); 
   TextEditingController email = TextEditingController(); 
   TextEditingController pass = TextEditingController(); 
   TextEditingController cpass = TextEditingController(); 
   TextEditingController ph = TextEditingController(); 
   TextEditingController add = TextEditingController();  


   @override
   void dispose(){
     firstname.clear();
     lastname.clear();
     cnic.clear();
     email.clear();
     pass.clear();
     cpass.clear();
     ph.clear();
     add.clear();
     selectcity='Select City';
     dateOfBirth=DateTime.now();

     super.dispose();

   }



    List<String> city = [
      "Karachi",
      "Lahore",
      "Faisalabad",
      "Rawalpindi",
      "Multan",
      "Peshawar",
      "Islamabad",
      "Quetta",
      "Mardan",
    ];
     void submit() {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   formKey.currentState!.save();


      }


  String getText() {

  return '${dateOfBirth.month}/${dateOfBirth.day}/${dateOfBirth.year}';
      
    }

    // Signup User

    Future<String> signup({
      
      required String firstname,
      required String lastname,
      required String cnic,
      required String email,
      required String confirmpass,
      required String phone,
      required String address,
      required String gender,
      required String dob,
      required String city,
    }) async{
      
      String res ="some error occurred";
      try{

        // register user

         UserCredential cred =await _auth.createUserWithEmailAndPassword(email: email, password: confirmpass);

          print(cred.user!.uid);

         // add user to our database
         
         _firestore.collection('users').doc(cred.user!.uid).set({
            'firstname': firstname,
            'lastname': lastname,
            'cnic':     cnic,
            'email':    email,
            'gender': gender,
            'Date of Birth':dob,
            'city': city,
            'phone' : phone,
            'address': address,
         }).then((value) async {
           SharedPreferences prefs = await SharedPreferences.getInstance();
           prefs.setString('email', email);
         });
         res= "success";
      }
      catch(err){
        res=err.toString();

      }
      return res;

    }

    
    

}
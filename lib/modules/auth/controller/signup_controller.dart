import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
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

    
    

}
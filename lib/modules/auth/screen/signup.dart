import 'dart:developer';

import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/auth/controller/signup_controller.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  // final _controller= Get.put(SignupController());
  bool _isobsecure=true;
  bool obsecure=true;
   bool isLoading =false;
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore= FirebaseFirestore.instance;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
    DateTime dateOfBirth = DateTime.now();
    String Location_latitude = "";
     String Location_longtitude = "";
String address = "";
 String location ='Null, Press Button';
  String Address = 'search';
  
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
      required String LAT,
      required String long,
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
         
               String? token = await FirebaseMessaging.instance.getToken();
         _firestore.collection('worker').doc(FirebaseAuth.instance.currentUser?.email).set({

      

            'firstname': firstname,
            'lastname': lastname,
            'cnic':     cnic,
            'email':    email,
            'gender': gender,
            'Date of Birth':dob,
            'city': city,
            'phone' : phone,
            'lat': LAT,
            'long': long,
            'FCM token': token
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

  @override
  Widget build(BuildContext context) {
      String formatedate= DateFormat.yMMMd().format(dateOfBirth);
    // Size size = MediaQuery.of(context).size;
      
 
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 90, top: 30, right: 50),
              child: const Image(
                image: AssetImage('assets/logo.png'),
                width: 260,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: screenHeight(context)*0.06,
                           width: screenWidth(context)*0.43,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                         
                            controller: firstname,
                             
                              
                               keyboardType: TextInputType.name,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person, color: Colors.blue.shade900,),
                                labelText: "First Name",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                     validator: (value){
                            if(value!.isEmpty ){
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                                       
                             
                            ),
                          ),
                         const  SizedBox(width: 10,),
                         Container(
                            height: screenHeight(context)*0.06,
                           width: screenWidth(context)*0.43,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                         
                            controller: lastname,
                             
                              
                               keyboardType: TextInputType.name,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_add, color: Colors.blue.shade900,),
                                labelText: "Last Name",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                       validator: (value){
                            if(value!.isEmpty ){
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                           
                              
                             
                            ),
                          ),
                         
                        ],
                      ),
                         
                       Container(
                            height: screenHeight(context)*0.06,
                            width: screenWidth(context)*0.9,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                         
                            controller: cnic,
                             
                              
                               keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.perm_identity,color: Colors.blue.shade900,),
                                labelText: "CNIC",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Field cannot be empty";
                                      
                                      }
                                      if(value.length < 13){
                                        return "Please enter 13 digit";
                                      }
                                      if(value.length > 13){
                                        return "Cnic digit should not greater tha 13";
                                      }
                                    },
                           
                              
                             
                            ),
                          ),
                           Container(
                            height: screenHeight(context)*0.06,
                            width: screenWidth(context)*0.9,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                            controller: email,
                               keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon:  Icon(Icons.email, color: Colors.blue.shade900,),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                     validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                if (!value.contains('@')) {
                  return "A valid email should contain '@'";
                }
                if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
                  return "Please enter a valid email";
                }
              }
               ),
                          ),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Container(
                             height: screenHeight(context)*0.06,
                            width: screenWidth(context)*0.43,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              
                              obscureText: _isobsecure,
                         
                            controller: pass,
                            
                             
                              
                               keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              isDense: true,
                         contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                prefixIcon:  Icon(Icons.lock, color: Colors.blue.shade900,),
                                suffix: IconButton(onPressed: (){
                                  setState(() {
                                    _isobsecure=!_isobsecure;
                                  });
                                }, icon: Icon(
                                  _isobsecure?Icons.visibility:Icons.visibility_off
                                )),
                          
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                    validator: (value){
                                       confirmpass=value!;
                                      if(value.isEmpty){
                                        return "Field cannot be empty";
                                  
                                      }
                                      if(value.length<6){
                                        return 'Atleast 6 character long';
                                      }
                                      return null;
                                    }
                           
                              
                             
                            ),
                          ),
                          
                         const  SizedBox(width: 10,),
                         Container(
                             height: screenHeight(context)*0.06,
                            width: screenWidth(context)*0.43,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              obscureText: obsecure,
                         
                            controller:cpass,
                             
                              
                               keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              isDense: true,
                         contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                prefixIcon:  Icon(Icons.lock, color: Colors.blue.shade900,),
                                suffix: IconButton(onPressed: (){
                                  setState(() {
                                    obsecure=!obsecure;
                                  });
                                }, icon: Icon(
                                  obsecure? Icons.visibility:Icons.visibility_off
                                )),
                                
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Field cannot be empty";
                                      }
                                      if(value.length<6){
                                        return 'Atleast 6 character long';
                                      }
                                      if(value != confirmpass){
                                        return "Password not match";

                                      }
                                      return null;
                                    },
                           
                              
                             
                            ),
                          ),
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Gender :',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times New Roman",
                                color: Colors.blue[800]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Male',
                                  groupValue: data,
                                  onChanged: (value) {
                                    setState(() {
                                      data = value.toString();
                                    });
                                  }),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Times New Roman",
                                    color: Colors.blue[800]),
                              ),
                            ],
                          ),
                        const   SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Female',
                                  groupValue: data,
                                  onChanged: (value) {
                                    setState(() {
                                      data = value.toString();
                                    });
                                  }),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Times New Roman",
                                    color: Colors.blue[800]),
                              ),
                              
                            ],
                          ),
                          
                        ],
                      ),
                      Container(
                        
                        margin: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Date of Birth :",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times New Roman",
                                  color: Colors.blue[800]),
                            ),
                           
                            FlatButton(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.blue[800],
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      getText(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: "Times New Roman"),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                color: Colors.white,
                                textColor: Colors.black,
                                onPressed: () async {
                                  pickDate(context);
                                }),
                          ],
                        ),
                      ),
                      
                      AwesomeDropDown(
                        dropDownList: city,
                        selectedItem: selectcity,
                        onDropDownItemClick: (selectedItem) {
                          setState(() {
                            selectcity = selectedItem;
                          });
                         
                        
                        },
                        numOfListItemToShow: 5,
                        padding: 5,
                        dropDownIcon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.blue[800],
                        ),
                        dropDownBGColor: Colors.white,
                        dropDownOverlayBGColor: Colors.white,
                        dropDownListTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        selectedItemTextStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.blue[800],
                        ),
                      ),
                        
                       Container(
                            height: screenHeight(context)*0.06,
                            width: screenWidth(context)*0.9,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                         
                            controller: ph,
                             
                              
                               keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone, color: Colors.blue.shade900,),
                                labelText: "Phone",
                                labelStyle: TextStyle(color: Colors.blue[800]),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))),
                                    validator: (value){
                                      if(value!.length < 11){
                                        return 'Number should not less than 11 digit';
                                      }
                                      if(value.length>11){
                                        return 'Number should not greater than 11 digit';
                                      }
                                    },
                           
                              
                             
                            ),
                          ),
                      Column(
                        children: [
                          Text("position: $Location_latitude"),
                          Text("position: $Location_longtitude"),
                        ],
                      ),
            Text("ADDRESS : $address" ),
          ActionButton(
            // text: "",
            ontap: () async{
            Position position = await _determinePosition();
            Location_latitude = 'LAT: ${position.latitude}';
            Location_longtitude= 'long: ${position.longitude}';
            // GetAddressFromLatLong(position);
            
            setState(() {
              
            });
            

          }, text: 'Allow Location access',
          ),
                      
                  
                      Container(
                        
                        child: isLoading?const Center(child: CircularProgressIndicator()):ActionButton(ontap: () async{
                          
                           
                          log(formatedate);

                              final isValid = formKey.currentState!.validate();
                          if (!isValid) {
                                return;
                                     }
                            formKey.currentState!.save();          
                          setState(() {
                          isLoading=true;
                          });
                           String res = await signup(firstname: firstname.text, lastname: lastname.text, cnic: cnic.text, email: email.text, confirmpass: cpass.text, gender: data,dob: formatedate,city: selectcity, phone:ph.text, LAT: Location_latitude, long: Location_longtitude);
                              setState(() {
                            isLoading=false;
                          });
                              if(res !='success'){
                                showSnackBar(res, context);
                              }  
                              else{
                              
                           Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>skills()));
                             dispose();

                          //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const LocationData()));
                   
                              }                     
                          
                          

                    
                
                        },
                        
                        
                        text: "Sign Up", 
                        bordersidecolor: Colors.white,
                        color: Colors.blue.shade900,
                        width: screenWidth(context)*0.4,
                        
                        ),
                      ),  

                     
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: dateOfBirth,
    );

    if (newDate == null) return;
    setState(() {
      dateOfBirth = newDate;
    });
  }

  


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 


  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

Future<void> GetAddressFromLatLong(Position position)async {

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print("placemarks data");
    print(placemarks);
    // print("latitude data");
    // var lat = position.latitude;
    // print("longitude data");
    // var long = position.longitude;
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }
}

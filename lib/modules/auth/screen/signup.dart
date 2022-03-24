import 'dart:developer';

import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  final _controller= Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
      String formatedate= DateFormat.yMMMd().format(_controller.dateOfBirth);
    Size size = MediaQuery.of(context).size;
    

    
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
                key: _controller.formKey,
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
                         
                            controller: _controller.firstname,
                             
                              
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
                         
                            controller: _controller.lastname,
                             
                              
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
                         
                            controller: _controller.cnic,
                             
                              
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
                            controller: _controller.email,
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
                         
                            controller: _controller.pass,
                             
                              
                               keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon:  Icon(Icons.lock, color: Colors.blue.shade900,),
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
                                      _controller.confirmpass=value!;
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
                         
                            controller:_controller.cpass,
                             
                              
                               keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon:  Icon(Icons.lock, color: Colors.blue.shade900,),
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
                                      if(value != _controller.confirmpass){
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
                                  groupValue: _controller.data,
                                  onChanged: (value) {
                                    setState(() {
                                      _controller.data = value.toString();
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
                                  groupValue: _controller.data,
                                  onChanged: (value) {
                                    setState(() {
                                      _controller.data = value.toString();
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
                                      _controller.getText(),
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
                        dropDownList: _controller.city,
                        selectedItem: _controller.selectcity,
                        onDropDownItemClick: (selectedItem) {
                          setState(() {
                            _controller.selectcity = selectedItem;
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
                         
                            controller: _controller.ph,
                             
                              
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
                      
                      
                       Container(
                           height: screenHeight(context)*0.1,
                        width: screenWidth(context)*0.9,
              
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                         
                            controller: _controller.add,
                             
                              
                               keyboardType: TextInputType.streetAddress,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on, color: Colors.blue.shade900,),
                                labelText: "Address",
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
                                         return 'Field cannot be empty';
                                       }
                                    },
                           
                              
                             
                            ),
                          ),
                      Container(
                        
                        child: _controller.isLoading?const Center(child: CircularProgressIndicator()):ActionButton(ontap: () async{

                          log(formatedate);

                              final isValid = _controller.formKey.currentState!.validate();
                          if (!isValid) {
                                return;
                                     }
                            _controller.formKey.currentState!.save();          
                          setState(() {
                            _controller.isLoading=true;
                          });
                           String res = await _controller.signup(firstname: _controller.firstname.text, lastname: _controller.lastname.text, cnic: _controller.cnic.text, email: _controller.email.text, confirmpass: _controller.cpass.text, gender: _controller.data,dob: _controller.dateOfBirth.toString(),city: _controller.selectcity, phone: _controller.ph.text, address: _controller.add.text);
                              setState(() {
                            _controller.isLoading=false;
                          });
                              if(res !='success'){
                                showSnackBar(res, context);
                              }  
                              else{
                           Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const skills()));
                           _controller.dispose();
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
      lastDate: _controller.dateOfBirth,
    );

    if (newDate == null) return;
    setState(() {
      _controller.dateOfBirth = newDate;
    });
  }
}

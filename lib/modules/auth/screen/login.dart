import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/auth/controller/login_controller.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/custom_buttons.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
 final _controller= Get.put(LoginController());
 

  @override
  Widget build(BuildContext context) {
    bool _isobsecure = true;
    
    void _toggle() {
    setState(() {
      _isobsecure = !_isobsecure;
    });
  }
    
    return Scaffold(
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
            //   
             Image.asset("assets/logo.png", 
             fit: BoxFit.contain,
             width: MediaQuery.of(context).size.width*0.5,
             height: MediaQuery.of(context).size.height*0.3,
             
             ),
             Text("Welcome! Login to access Xtremes Skills", 
             style: GoogleFonts.poppins(),
             ),
              Container(
                           height: screenHeight(context)*0.06,
                width: screenWidth(context)*0.7,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                                
                            controller: _controller.eml,

                             
                              
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

                Container(
                              height: screenHeight(context)*0.06,
                width: screenWidth(context)*0.7,
                            margin: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              obscureText: _isobsecure,
                         
                            controller: _controller.pass,
                             
                              
                               keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon:  Icon(Icons.lock, color: Colors.blue.shade900,),
                                suffix:  InkWell(
                                  onTap: _toggle,
                                  child: Icon(_isobsecure? Icons.visibility:Icons.visibility_off)),
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
                                     
                                      if(value!.isEmpty){
                                        return "Field cannot be empty";
                                  
                                      }
                                      
                                      return null;
                                    }
                           
                              
                             
                            ),
                          ),
             
              
              
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  child: _controller.isLoading? const Center(child: CircularProgressIndicator(),):ActionButton(
                    width: MediaQuery.of(context).size.width*0.4,
                    bordersidecolor: Colors.white,
                    color:Colors.blue.shade900,
                    text: "Login",
                    ontap: () async{
                      

                               final isValid = _controller.formKey.currentState!.validate();
                          if (!isValid) {
                            return;
                                
                                     }
                            _controller.formKey.currentState!.save();
                            setState(() {
                        _controller.isLoading=true;
                      });

                      String res =await _controller.login(email: _controller.eml.text, password: _controller.pass.text);
                      log(res);
                       setState(() {
                          _controller.isLoading=false;
                        });
                      if(res !='success'){
                       
                             showSnackBar(res, context);
                      }
                      else{
                   
                             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const LocationData()));
                             _controller.dispose();
                      }        
                                 
              
                      
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: MyGestures(
                    text: "Forget Password?",
                    ontap: (){
        
                    },
                  ),
                ),
              ],),
             const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 0.2,
                      indent: 20,
                      endIndent: 20,
                    ),
            //  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Don't have an Account? ", 
                      style: GoogleFonts.poppins(),
                      ),
                    ),
                  MyGestures(
                    text: "Sign Up Here",
                  ontap: (){
                    Get.to(const signup());
        
                  },
                  )
                ],),
            
          ],
          ),
        ),
      ),
    );
  }
}


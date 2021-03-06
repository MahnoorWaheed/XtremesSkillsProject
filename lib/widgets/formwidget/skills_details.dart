import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtremes_skills/model/user.dart';
import 'package:xtremes_skills/model/workermodel.dart';
import 'package:xtremes_skills/modules/User%20Screens/select_task.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/utils/utils.dart';

enum ViewState { loading, idle }

var cartState = ViewState.idle;
class Skill_Details extends StatefulWidget {
  WorkerModel cart;
  final String SkillName;
  final String Service1;
  final String Service2;
  final String Service3;



 Skill_Details(this.SkillName,this.Service1, this.Service2, this.Service3, this.cart

 );


  @override
  State<Skill_Details> createState() => _Skill_DetailsState();
}

class _Skill_DetailsState extends State<Skill_Details> {

   final form = GlobalKey<FormState>();
 bool valuefirst = false;  
  bool valuesecond = false; 
    bool valuethird = false; 
     bool valuefourth = false; 
    String codeDialog = '';
  String valueText = ''; 
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
 
  String service = '';


  bool isLoading = true;
  // late QuerySnapshot namee;
   String workerfirstName = '';
  String workerlastname = '';
  String workercity = '';
  String workerlati = '';
  String workerlongi = '';
  String workeremail = '';
  String workerfcmtoken = '';
  @override
  void initState() {
    getUserData();
    super.initState();
    
  }



   getUserData() async {
    await FirebaseFirestore.instance
        .collection('worker')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((value) {
      print(value.docs.first.data()['firstname']);
      print(value.docs.first.data()['lastname']);
      print(value.docs.first.data()['email']);
      print(value.docs.first.data()['FCM token']);
      print(value.docs.first.data()['city']);
      print(value.docs.first.data()['lat']);
      print(value.docs.first.data()['long']);
      workerfirstName = value.docs.first.data()['firstname'];
      workerlastname = value.docs.first.data()['lastname'];
      workercity = value.docs.first.data()['city'];
      workerlati = value.docs.first.data()['lat'];
      workerlongi = value.docs.first.data()['long'];
     workeremail = value.docs.first.data()['email'];
     workerfcmtoken = value.docs.first.data()['FCM_token'];
    });
    setState(() {
      isLoading = false;
    });
 }
String Price = '';
String time = '';
String Price2 = '';
String time2 = '';
String Price3 = '';
String time3 = '';
String txtdata = '';
String txtdata2 = '';
String txtdata3 = '';
String servicename = '';
String servicedes = '';
String servicetime = '';
String serviceprice = '';

  List<mySReportDetails2> myAllData = [];
  bool value = false;

   void clearText() {
   
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    print("Skill name 2"+ widget.SkillName,);
    return Scaffold(
      appBar: AppBar(
                  leading: Icon(Icons.people),
                  title: Text('${widget.SkillName} Service Details'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: (){},
                      //widget.onDelete,
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
      body:  Padding(
      padding: EdgeInsets.all(8),
      child: Form(
          key: form,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [        
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                       children: [                 
                      CheckboxListTile(                        
                      secondary: const Icon(Icons.electrical_services, color: Colors.blue,),  
                      title: Text(widget.Service1,
                      style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),),                      
                      subtitle: Column(
                      children: [
                      SizedBox(height: 10),
                      TextFormField(
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                      
                      fillColor: Colors.white,
                      hintText : "Service Description",
                      hintStyle: TextStyle(
                      color: Colors.blue[800],),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.blue)),
                      enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
                      onChanged: (value){ 
                        setState(() {
                          txtdata = value;
                        });
                         },),
                      SizedBox(height: 10,),
                     ],), 
                      value: this.valuefirst,
                      onChanged: (value){
                     
                      setState(() {  
                      this.valuefirst = value!;

                     
                          
                        }); 
                        
                            
                      
                       }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.33,
                      child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                      labelText: "Timing",
                      labelStyle: TextStyle(color: Colors.blue[800],
                      fontSize: 14),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.blue),),
                      enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
                                    
                                                 
                      onChanged: (value){
                      setState(() {time = value;});},),),
                      SizedBox(width: 5,),
                      Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.33,
                      child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                      labelText: "Price",
                      labelStyle: TextStyle(color: Colors.blue[800],
                      fontSize: 14),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.blue),),
                      enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),

                      onChanged: (value){
                      setState(() {
                      Price = value;
                      });},),),],),
                       ActionButton(ontap: (){
                         if(this.valuefirst == true) {
                        Provider.of<WorkerModel>(context, listen: false).add({
                             
                             "Service" : "${widget.Service1}",
                             "description":"${txtdata}",
                             "time":"${time}",
                             "Price":"${Price}",
                             "value": value,
                            

                        
                         
                          });

                        }else{
                        
                           ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Please select service'),
                            
                          ),
                        );
                        }
                        
                         }, text: "Add Service")
                       ] )), 
                       
                       ),
                       
                 
                      
                   
                  
               
               Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                       children: [                 
                                            CheckboxListTile(                        
                      secondary: const Icon(Icons.electrical_services, color: Colors.blue,),  
                      title: Text(widget.Service2,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),                      
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                           TextFormField(
                             minLines: 2,
                             maxLines: 5,
                             keyboardType: TextInputType.multiline,
                             decoration: InputDecoration(
                                fillColor: Colors.white,
                   hintText : "Service Description",
                   hintStyle: TextStyle(
                     color: Colors.blue[800],
                     
                   ),
                
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.blue),
                   ),
                    enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
                             
                 
                            onChanged: (value){
                
                       txtdata2 = value;
                 
                             
                            },
                            ),
                            SizedBox(height: 10,),
                           
                            
                        ],
                      ), 
                      value: this.valuesecond,
                      onChanged: (value){
                        setState(() {  
                          this.valuesecond = value!;
                            
                        }); 
            
                       }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                     height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.33,
                                  child: TextFormField(
                                   
                                   
                                       
                                        
                                         keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                                          labelText: "Timing",
                                          labelStyle: TextStyle(color: Colors.blue[800],
                                          fontSize: 14,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(color: Colors.blue),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.blue))),
                               
                                                 
                                         onChanged: (value){
                                            setState(() {
                                             time2 = value;
                                           });

                                              },
                                      ),
                                ),
                                SizedBox(width: 5,),
                                 Container(
                                   height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.33,
                                
                                child: TextFormField(
                             
                               
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                                    labelText: "Price",
                                    labelStyle: TextStyle(color: Colors.blue[800],
                                    fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                             
                                 onChanged: (value){
                                    setState(() {
                                       Price2 = value;
                                     });

                                        },
                                  
                                 
                                ),
                              ),
                              ],
                            ),
                       ActionButton(ontap: (){
                         if(this.valuesecond == true){
                          Provider.of<WorkerModel>(context, listen: false).add({
                             
                             "Service" : "${widget.Service2}",
                             "description":"${txtdata2}",
                             "time":"${time2}",
                             "Price":"${Price2}",
                              "value": value,

                          
                         
                          });
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Please select service'),
                            
                          ),
                        );
                        }
                        
                         }, text: 'Add Service')
                      ]
                    )
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                       children: [                 
                                            CheckboxListTile(                        
                      secondary: const Icon(Icons.electrical_services, color: Colors.blue,),  
                      title: Text(widget.Service3,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),                      
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                           TextFormField(
                             minLines: 2,
                             maxLines: 5,
                             keyboardType: TextInputType.multiline,
                             decoration: InputDecoration(
                                fillColor: Colors.white,
                   hintText : "Service Description",
                   hintStyle: TextStyle(
                     color: Colors.blue[800],
                     
                   ),
                
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.blue),
                   ),
                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                             
                 
                            onChanged: (value){
                  //  setState(() {
                       txtdata3 = value;
                  //  });
                             
                            },
                            ),
                            SizedBox(height: 10,),
                           
//                             
                        ],
                      ), 
                      value: this.valuethird,
                      onChanged: (value){
                        setState(() {  
                          this.valuethird = value!;
                            
                        }); 
            
                       }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                               height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.33,
                                  child: TextFormField(
                                   
                                   
                                       
                                        
                                         keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                                          labelText: "Timing",
                                          labelStyle: TextStyle(color: Colors.blue[800],
                                          fontSize: 14),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(color: Colors.blue),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.blue))),
                                  
                                                 
                                         onChanged: (value){
                                            setState(() {
                                             time3 = value;
                                           });

                                              },
                                      ),
                                ),
                                SizedBox(width: 5,),
                                 Container(
                                   height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.33,
                                
                                child: TextFormField(
                             
                                // controller: lastname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                                    labelText: "Price",
                                    labelStyle: TextStyle(color: Colors.blue[800],
                                    fontSize: 14),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                            
                                 onChanged: (value){
                                    setState(() {
                                       Price3 = value;
                                     });

                                        },
                                  
                                 
                                ),
                              ),
                              ],
                            ),
                       ActionButton(ontap: (){
                         if(this.valuethird == true){
                          Provider.of<WorkerModel>(context, listen: false).add({
                             
                             "Service" : "${widget.Service3}",
                             "description":"${txtdata3}",
                             "time":"${time3}",
                             "Price":"${Price3}",
                              "value": value,

                     
                         
                          });
                       }else{
                           ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Please select service'),
                            
                          ),
                        );
                       }
                       
                       }, text: 'Add Service')
                      ]
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    openDialog2();
                  },
                  child: Card(
                    child:ListTile(  
                      leading: Icon(Icons.devices_other, color: Colors.blue.shade900,),
                        title: Text("Other",
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        )),  
                        subtitle: Text("Enter your own service",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        )),  
                       ),
                  
                              
                  ),
                ),


               
                  ActionButton(ontap: () async {

                     
                    print("my all data");
                     print(myAllData);

                         Provider.of<WorkerModel>(context, listen: false).addAll({
                             "worker_token": workerfcmtoken,
                             "Skill Name" : "${ widget.SkillName}",
                             "firstname":"${workerfirstName}",
                             "lastname":"${workerlastname}",
                             "city":"${workercity}",
                            "worker_lati":"${workerlati}",
                             "worker_longi":"${workerlongi}",
                               "workeremail":"${workeremail}",
                               
                             
                                      
                                     
                         
                          });

                 
                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>  BottomNav()));



   }, text: "Continue"


                  
                        ),


                          ],
            ),
          ),
        ),
      
    )
      
    );
  }

Future openDialog2(){
  return showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context) {
         return  AlertDialog(
      title: Text(
        'Enter Service Details',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        //Theme.of(context).textTheme.title.color,
        fontWeight: FontWeight.w800,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      actions: <Widget>[
       TextButton(onPressed: (){
         Navigator.of(context).pop();
       }, child: Text("Cancel")),
       TextButton(onPressed: (){
        Provider.of<WorkerModel>(context, listen: false).add({
                             
                             "Service" : "${servicename}",
                             "description":"${servicedes}",
                             "time":"${servicetime}",
                             "Price":"${serviceprice}",
                             "value": value,


                      
                         
                          });

         
       }, child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
           
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Service Name',
              ),
              textInputAction: TextInputAction.next,
           
            onChanged: (value){
         
                   servicename = value;
    
             
            },
            ),
            TextFormField(
           
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              textInputAction: TextInputAction.next,
      
            onChanged: (value){
            
                  servicedes = value;
             
             
            },
            ),
             TextFormField(
            
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'worker time',
              ),
              textInputAction: TextInputAction.next,
           
              onChanged: (value){
               
                  servicetime = value;
                
                
              },
            ),
            TextFormField(
             
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
           
              onChanged: (value){
              
                  serviceprice = value;
              
                
              },
            ),
           
            
          ],
        ),
      ),
    );
       });
}
}

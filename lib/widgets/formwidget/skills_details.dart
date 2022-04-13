import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/utils/utils.dart';


class Skill_Details extends StatefulWidget {
  final String SkillName;
  final String Service1;
  final String Service2;
  final String Service3;
  // final String Service4;
  // final String details1;
  // final String details2;
  // final String details3;
  // final String details4;

  // String prc;
  // int ct = 1;

 Skill_Details(this.SkillName,this.Service1, this.Service2, this.Service3, 
//  this.Service4, 
 //this.Service2, this.Service3, this.Service4,
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

 String userName = '';
  String userEmail = '';
  bool isLoading = true;
  @override
  void initState() {
    // getUserData();
    super.initState();
  }

  //  getUserData() async {
  //   await FirebaseFirestore.instance
  //       .collection('worker')
  //       .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
  //       .get()
  //       .then((value) {
  //     print(value.docs.first.data()['firstname']);
  //     print(value.docs.first.data()['lastname']);
  //     print(value.docs.first.data()['email']);
  //     userName = value.docs.first.data()['firstname'];
  //     userEmail = value.docs.first.data()['email'];
  //   });
  //   setState(() {
  //     isLoading = false;
  //   });
 // }
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

  @override
  Widget build(BuildContext context) {
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
                        fontSize: 18
                      ),),  
                      // subtitle: Text(widget.details1,
                      // style: TextStyle(
                      //  color: Colors.blue,
                      // ),),  
                      value: this.valuefirst,
                      onChanged: (value){
                        setState(() {  
                          this.valuefirst = value!;
                            
                        }); 
                         
                       }),
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
                             
                  // onEditingComplete: () {
                  //   // FocusScope.of(context).requestFocus(_nodeEmail);
                  // },
                            onChanged: (value){
                  //  setState(() {
                       txtdata = value;
                  //  });
                             
                            },
                            ),
                  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: firstname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                                    labelText: "work timing",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                              //            validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                                           
                                   onChanged: (value){
                                      setState(() {
                                       time = value;
                                     });
// time = value;
                                        },
                                ),
                              ),
                             const  SizedBox(width: 10,),
                             Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: lastname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                                    labelText: "Price",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                              //              validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                                 onChanged: (value){
                                    setState(() {
                                       Price = value;
                                     });

                                        },
                                  
                                 
                                ),
                              ),
                             
                            ],
                          ),
                
                      // CheckboxListTile(  
                      // controlAffinity: ListTileControlAffinity.trailing,  
                      // secondary: const Icon(Icons.alarm),  
                      // title: Text("Other"),  
                      // subtitle: Text("Enter your own service"),  
                      // value: this.valuefourth,  
                      // onChanged: (value) {  
                      //   setState(() {  
                      //     this.valuefourth = value!;  
                      //   });
                      //   openDialog2();
                      //   }),
                
                        // ActionButton(ontap: (){
                        //     openDialog();
                
                        // }, text: "Continue")
                      ]
                    )
                    // TextFormField(
                    //   initialValue: widget.user.service,
                    //   onSaved: (val) => widget.user.service = val!,
                    //   validator: (val) =>
                    //       val!.length > 7 ? null : 'Service feild is invalaid',
                    //   cursorColor: Colors.black,
                    //   decoration: InputDecoration(
                    //     labelText: 'Service',
                    //     // hintText: 'Enter your Service',
                    //     icon: Icon(
                    //       Icons.miscellaneous_services,
                    //       color: Colors.lightBlue,
                    //     ),
                    //     isDense: true,
                    //   ),
                    // ),
                  ),
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
                      // subtitle: Text(widget.details1,
                      // style: TextStyle(
                      //  color: Colors.blue,
                      // ),),  
                      value: this.valuesecond,
                      onChanged: (value){
                        setState(() {  
                          this.valuesecond = value!;  
                        }); 
                         
                       }),
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
                             
                  // onEditingComplete: () {
                  //   // FocusScope.of(context).requestFocus(_nodeEmail);
                  // },
                            onChanged: (value){
                  //  setState(() {
                       txtdata2 = value;
                  //  });
                             
                            },
                            ),
                  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: firstname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                                    labelText: "work timing",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
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
                              //            validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                                           
                                 
                                ),
                              ),
                             const  SizedBox(width: 10,),
                             Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: lastname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                                    labelText: "Price",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                              //              validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                                onChanged: (value){
                                   setState(() {
                                       Price2 = value;
                                     });

                                        },
                                  
                                 
                                ),
                              ),
                             
                            ],
                          ),
                
                      // CheckboxListTile(  
                      // controlAffinity: ListTileControlAffinity.trailing,  
                      // secondary: const Icon(Icons.alarm),  
                      // title: Text("Other"),  
                      // subtitle: Text("Enter your own service"),  
                      // value: this.valuefourth,  
                      // onChanged: (value) {  
                      //   setState(() {  
                      //     this.valuefourth = value!;  
                      //   });
                      //   openDialog2();
                      //   }),
                
                        // ActionButton(ontap: (){
                        //     openDialog();
                
                        // }, text: "Continue")
                      ]
                    )
                    // TextFormField(
                    //   initialValue: widget.user.service,
                    //   onSaved: (val) => widget.user.service = val!,
                    //   validator: (val) =>
                    //       val!.length > 7 ? null : 'Service feild is invalaid',
                    //   cursorColor: Colors.black,
                    //   decoration: InputDecoration(
                    //     labelText: 'Service',
                    //     // hintText: 'Enter your Service',
                    //     icon: Icon(
                    //       Icons.miscellaneous_services,
                    //       color: Colors.lightBlue,
                    //     ),
                    //     isDense: true,
                    //   ),
                    // ),
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
                      // subtitle: Text(widget.details1,
                      // style: TextStyle(
                      //  color: Colors.blue,
                      // ),),  
                      value: this.valuethird,
                      onChanged: (value){
                        setState(() {  
                          this.valuethird = value!;  
                        }); 
                         
                       }),
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
                             
                  // onEditingComplete: () {
                  //   // FocusScope.of(context).requestFocus(_nodeEmail);
                  // },
                            onChanged: (value){
                  //  setState(() {
                       txtdata3 = value;
                  //  });
                             
                            },
                            ),
                  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: firstname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_clock, color: Colors.blue.shade900,),
                                    labelText: "work timing",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                              //            validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                                          onChanged: (value){
                                             setState(() {
                                      time3 = value;
                                     });

                                        },   
                                 
                                ),
                              ),
                             const  SizedBox(width: 10,),
                             Container(
                                height: screenHeight(context)*0.06,
                               width: screenWidth(context)*0.43,
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                             
                                // controller: lastname,
                                 
                                  
                                   keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.payment, color: Colors.blue.shade900,),
                                    labelText: "Price",
                                    labelStyle: TextStyle(color: Colors.blue[800]),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue))),
                              //              validator: (value){
                              //   if(value!.isEmpty ){
                              //     return "Field cannot be empty";
                              //   }
                              //   return null;
                              // },
                               
                                   onChanged: (value){
                                     setState(() {
                                       Price3 = value;
                                     });

                                        }, 
                                 
                                ),
                              ),
                             
                            ],
                          ),
                
                      // CheckboxListTile(  
                      // controlAffinity: ListTileControlAffinity.trailing,  
                      // secondary: const Icon(Icons.alarm),  
                      // title: Text("Other"),  
                      // subtitle: Text("Enter your own service"),  
                      // value: this.valuefourth,  
                      // onChanged: (value) {  
                      //   setState(() {  
                      //     this.valuefourth = value!;  
                      //   });
                      //   openDialog2();
                      //   }),
                
                        // ActionButton(ontap: (){
                        //     openDialog();
                
                        // }, text: "Continue")
                      ]
                    )
                    // TextFormField(
                    //   initialValue: widget.user.service,
                    //   onSaved: (val) => widget.user.service = val!,
                    //   validator: (val) =>
                    //       val!.length > 7 ? null : 'Service feild is invalaid',
                    //   cursorColor: Colors.black,
                    //   decoration: InputDecoration(
                    //     labelText: 'Service',
                    //     // hintText: 'Enter your Service',
                    //     icon: Icon(
                    //       Icons.miscellaneous_services,
                    //       color: Colors.lightBlue,
                    //     ),
                    //     isDense: true,
                    //   ),
                    // ),
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
                  ActionButton(ontap: (){
                            // openDialog();
//                             String Price = '';
// String time = '';
// String Price2 = '';
// String time2 = '';
// String Price3 = '';
// String time3 = '';
//  bool valuefirst = false;  
//   bool valuesecond = false; 
//     bool valuethird = false; 

// List<dynamic> list = {[widget.Service1,time,Price],[widget.Service1,time2,Price2],[widget.Service1,time3,Price3]} as List;
if(time != null && Price != null && time2 != null && Price2 != null && time3 != null && Price3 != null){
Map<String,dynamic> ourData = {
  'SkillName': widget.SkillName,
"key": {"Service": widget.Service1,"description": txtdata,"time": time, "Price": Price,},
"key1": {"Service": widget.Service2,"description": txtdata2,"time": time2, "Price": Price2},
"key2": {"Service": widget.Service3,"description": txtdata3,"time": time3, "Price": Price3},
"other": {"Service": servicename,"description": servicedes,"time": servicetime, "Price": serviceprice},
// "${widget.Service3}": {"time": time3, "Price": Price3},
};
  _firestore.collection('worker').doc('rimi@gmail.com').collection("worker_skills").doc("rimi@gmail.com").set(ourData);
                                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Dashboard()));
                     
                        
}

   }, text: "Continue"

// print("list of data: ${list}");
                  
                        )
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
       }, child: Text("Cancle")),
       TextButton(onPressed: (){
       

         
       }, child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              // controller: txt1,
              // focusNode: _nodePhone,
              // maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Service Name',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeEmail);
              },
            onChanged: (value){
              //  setState(() {
                   servicename = value;
              //  });
             
            },
            ),
            TextFormField(
              // controller: txt1,
              // focusNode: _nodePhone,
              // maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeEmail);
              },
            onChanged: (value){
              //  setState(() {
                  servicedes = value;
              //  });
             
            },
            ),
             TextFormField(
              // focusNode: _nodeEmail,
              // controller: txt2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'worker time',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeFullname);
              },
              onChanged: (value){
                // setState(() {
                  servicetime = value;
                // });
                
              },
            ),
            TextFormField(
              // focusNode: _nodeEmail,
              // controller: txt2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeFullname);
              },
              onChanged: (value){
                // setState(() {
                  serviceprice = value;
                // });
                
              },
            ),
           
            
          ],
        ),
      ),
    );
       });
}
}
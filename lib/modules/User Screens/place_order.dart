import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/wallet_method.dart';

class PlaceOrder extends StatefulWidget {
  
var total_amount;
String name;

 PlaceOrder(this.total_amount,this.name, 


 );
  

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
  
}

class _PlaceOrderState extends State<PlaceOrder> {
   bool _checkbox=false;
   final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final TextEditingController review= TextEditingController();
  List<Map<String, dynamic>> personaldata = [];
String username="";


 void dispose(){
   review.clear();
   rating=0;
 }

  @override
   initState() {
  
    super.initState();
  
    getCurrentUser();
  }
  

     getCurrentUser() async {
    await _firestore
        .collection("customer")
        .doc(_auth.currentUser!.phoneNumber)
        .get()
        .then((value) {
            setState(() {
              username= value['name'];           
      });     
    });
    log('okkkkkkk');
    log(username);
  }
  
  double rating=0;
     storedata({
      required double rating,
      required String review,
    }) {
      _firestore.collection("reviews").add({
          'rating': rating,
          'review': review,
          'name': username,
          'workername':widget.name
           
           
      });
      
    }
    _displayDialog(BuildContext context) async {  
          String? usertoken =await FirebaseMessaging.instance.getToken();
                      _firestore.collection('orders').doc().set(
                       {
                          'name':username,
                        'description': "order place",
                        'userFCM_token': usertoken,
                        'workername':widget.name,
                       }
                      ); 
    await Future.delayed(const Duration(milliseconds: 1000)); showDialog(  
        context: context,  
        builder: (context) {  
          return AlertDialog(  
            title: const Text('Rate the Service'),  
            content: 
           Column(
             mainAxisSize: MainAxisSize.min,
             children: [
                RatingBar.builder(
   initialRating: rating,
   minRating: 0,
   direction: Axis.horizontal,
   allowHalfRating: false,
   itemCount: 5,
   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => const Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (value) {
     rating=value;
     log("$rating");
   },
),
            TextField(  
              controller: review,
                
              decoration: const InputDecoration(hintText: "Review"),  
            ),  
             ],
           ),
            actions: <Widget>[ 
              TextButton(onPressed: (){
                storedata(rating: rating,review: review.text);
                dispose();
                  Navigator.of(context).pop();  
                   var snackBar = const SnackBar(content: Text('Thank you for giving feedback'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
             Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_)=> DasboardUser())
                                            );
                
                // Navigator.of(context)
                //       .push(MaterialPageRoute(
                //           builder: (context) => const BottomNav(),
                //               ));
                          
                  
              }, child: const Text("submit"))
               
            ],  
          );  
        });  }
   static const TextStyle kBlackTextStyle =
      TextStyle(color: Colors.black, );
  var price = 300;

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Text('Total Bill: Rs ${widget.total_amount}',
                      style: kBlackTextStyle.copyWith(fontSize: 17,  fontFamily: 'Montserrat',))
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/worker.jpg'),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Home Cleaner',
                            style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                        Text('2 items: Delivery Time 30 mins',
                            style: kBlackTextStyle.copyWith(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.normal,  fontFamily: 'Montserrat',)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/home.png'),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Home Address',
                            style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                        Text(
                            'D Block Ram Nagpur Near Sai Petrol \n'
                            'Pump Ring Road Nagpur - 440001',
                            style: kBlackTextStyle.copyWith(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.normal, fontFamily: 'Montserrat',)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
                height: 1,
                color: Colors.grey[350],
                width: MediaQuery.of(context).size.width - 50,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Credit/Debit Cards',
                        style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                    Text('ADD NEW CARD',
                        style: kBlackTextStyle.copyWith(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                           fontFamily: 'Montserrat',
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Image(image: AssetImage('assets/credit.jpg')),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '*************4356\n'
                            'Ali Khan',
                            style: kBlackTextStyle.copyWith(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.normal, fontFamily: 'Montserrat',)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 25),
                height: 1,
                color: Colors.grey[350],
                width: MediaQuery.of(context).size.width - 50,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text('Save and Pay via cards',
                      style: kBlackTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.normal, fontFamily: 'Montserrat',))),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/credit.jpg'),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    const SizedBox(width: 20),
                    Image(
                      image: const AssetImage('assets/master.png'),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                   const  SizedBox(width: 20),
                    Image(
                      image: const AssetImage('assets/visa card.jpg'),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text('Wallet Method',
                    style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                children: [
        WalletMethod(
                image: Image(
                  image: const AssetImage('assets/paypal.png'),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.07,
                ),
                title: 'Pay Pal',
              ),
              WalletMethod(
                image: Image(
                  image: const AssetImage('assets/jazz.png'),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.07,
                ),
                title: 'Jazz Cash',
              ),
              WalletMethod(
                image: Image(
                  image: const AssetImage('assets/easypaisa.png'),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.07,
                ),
                title: 'Easy Paisa',
              ),
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                
                 Container(
                   child: Row(
                     children: [
                        Icon(Icons.payments,size: 35,color: Colors.blue.shade900,),
                  const SizedBox(width: 10,),
                  const Text('Cash',style: TextStyle(fontSize: 18),),
                     ],
                   ),
                 ),
                    Checkbox(
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                         _checkbox = !_checkbox;
                      });
                          },
                      ),
                ],
              )
             
                ],
              )
              ),
              // WalletMethod(
              //   image: Image(
              //     image: AssetImage('assets/images/phone.png'),
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     width: MediaQuery.of(context).size.height * 0.07,
              //   ),
              //   title: 'Phone Pay',
              // ),
              // WalletMethod(
              //   image: Image(
              //     image: AssetImage('assets/images/google.png'),
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     width: MediaQuery.of(context).size.height * 0.07,
              //   ),
              //   title: 'Google Pay',
              // ),
              // WalletMethod(
              //   image: Image(
              //     image: AssetImage('assets/images/payPal.png'),
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     width: MediaQuery.of(context).size.height * 0.07,
              //   ),
              //   title: 'Pay Pal',
              // ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ActionButton(
                    text: 'PAY NOW',
                    bordersidecolor: Colors.blue.shade900,
                    color: Colors.blue.shade900,
                    ontap: () async{
                      var snackBar;
                       
                         print(_checkbox);
                    
                         _checkbox?     _displayDialog(context):  snackBar = SnackBar(content: Text('Please select payment method'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
       
                       
                    },
        
                  
        
            
        
                    // ontap: () async{
                    //   String? usertoken =await FirebaseMessaging.instance.getToken();
                    //   _firestore.collection('orders').doc().set(
                    //    {
                    //       'name':"Muhib",
                    //     'description': "hjkhjkh",
                    //     'userFCM_token': usertoken,
                    //    }
                    //   ); 
        
        
        
                      
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PayNow()),
                      // );
                    
                    )
                    )
                    )]),
        ),
      )
                );
            
  }
}
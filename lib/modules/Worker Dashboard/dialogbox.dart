import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/showrating.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({ Key? key }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
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
           
           
      });
      
    }
    _displayDialog(BuildContext context) async {  
    return showDialog(  
        context: context,  
        builder: (context) {  
          return AlertDialog(  
            title: const Text('TextField AlertDemo'),  
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
                Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => const BottomNav(),
                              ));
                          
                  
              }, child: const Text("submit"))
               
            ],  
          );  
        });  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(  
        title: Text(username),  
      ),  
       body: Center(  
        child: TextButton(onPressed: (){
          _displayDialog(context); 
        }, child: const Text('show alert'))
      ),  
    );
  }
}
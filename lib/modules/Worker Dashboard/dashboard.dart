

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/earning_container.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/worker_info_container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore firestore= FirebaseFirestore.instance;
 final FirebaseAuth auth = FirebaseAuth.instance;
 List<Map<String, dynamic>> personaldata = [];
 bool Loading=true;

// storeNotificationToken(){
//   ScrollDragController.momentumRetainStationaryDurationThreshold
// }


  @override
   initState() {
  
    super.initState();
  FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onMessage.listen(((event) {
    print("FCM message received");
  }));
    getCurrentUser();
  }
  
   getCurrentUser() async {
     log("function call");
     log(auth.currentUser!.uid);
    await firestore
        .collection("worker")
        .doc(auth.currentUser?.email)
        .get()
        .then((map) {
      setState(() {
        personaldata.add({
          "fname": map['firstname'],
          "lname": map['lastname'],
          "address": map['address'],
          "cnic": map['cnic'],
          "ph": map['phone'],
          "email": map['email'],
          
        });
        Loading=false;
        
        
      });
    });
    log("scuccessful");
    
  }
 
  @override
  Widget build(BuildContext context) {
    String data;
    return Scaffold(
      
      body: Loading ? const Center(child: CircularProgressIndicator(),)
      :SingleChildScrollView(
        child: SafeArea(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical:8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  //  Text("Ali khan", 
                  //  style: GoogleFonts.poppins(),
                  //  ),
                      Container(
                      
                        child: Flexible(
                child: ListView.builder(
                  
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Row(children: [
                          
                            Text(personaldata[index]['fname'],style: GoogleFonts.poppins(),),
                            Text(personaldata[index]['lname'],style: GoogleFonts.poppins(),),
                          ],)
                        );
                        
                    })),
                      ),
                    

                   const Padding(
                     padding:  EdgeInsets.only(right: 50.0),
                     child:  CircleAvatar(radius: 25,
                     child: Text("Picture of worker"),),
                   )
                 ],              
               ),
             ),
             Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight(context)*0.20,
        width: screenWidth(context),
        decoration: BoxDecoration(
      color: Colors.blue.shade900,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 3
        )
      ]
        ),
  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("Personal Information",
          style: GoogleFonts.poppins(color: Colors.white),
          ),
          Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Email:",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['email'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),
                      Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("CNIC:",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['cnic'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),
                         Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Phone Number",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['ph'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),

                     Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("ADDRESS:",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['address'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),

          
        ],)
      ),
    ),
             
            const WorkerInfo(),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Earnings"),
            ),
          
          const EarningContainer(),
       const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("To-Dos"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: screenHeight(context)*0.09,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black,
                    blurRadius: 3.0
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text("0 unread messages", 
                    style: GoogleFonts.poppins(color: Colors.white), 
                    ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ratings"),
            ),
           ],
         ),
           ),
      ),
      
    );
  }
}


// StreamBuilder<QuerySnapshot>( 
//         stream: firestore.collection("worker").snapshots(),
//         builder: (context, snapsot){
//           if(!snapsot.hasData){
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } 
        
//           // Text("${workerdata['firstname']}"),
//           return ListView.builder(
            
//             itemCount: snapsot.data!.docs.length,
//             itemBuilder: (context, index){
//               DocumentSnapshot workerdata= snapsot.data!.docs[index];
//               return Container(
//                 child: 
//               );

//             }
//             );
//         },
//       ) 





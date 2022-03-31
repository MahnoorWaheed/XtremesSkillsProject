

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/earning_container.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/worker_info_container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: SafeArea(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical:8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text("Ali khan", 
                   style: GoogleFonts.poppins(),
                   ),

                   const CircleAvatar(radius: 25,
                   child: Text("Picture of worker"),)
                 ],
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






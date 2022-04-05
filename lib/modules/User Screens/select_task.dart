import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/selectservice.dart';
import 'package:xtremes_skills/widgets/action_button.dart';

class NearbyWorkers extends StatefulWidget {
  String? data = '';
   NearbyWorkers({ Key? key, 
  this.data
   }) : super(key: key);

  @override
  State<NearbyWorkers> createState() => _NearbyWorkersState();
}

class _NearbyWorkersState extends State<NearbyWorkers> {
// final List<String> names=["Tv installation", "House Cleaning", "Dish Washer", 
// "Laundry ","Car cleaner", "Gardener"];

//   final List<String> address=["DHA Peshawar","Hayatabad","Saddar","Mall Road","Abdara Road"," Kohat Road"];

//  final List<String> price=["300/hr","100/hr","300/hr","100/hr","200/hr"," 300/hr"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("NearBy Workers"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.language_sharp),
            ),
        ],
      ), 
      
      body: StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection("workers").doc().collection("workerskill").snapshots(),
          
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
             itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, i){
                 DocumentSnapshot loc = snapshot.data!.docs[i];
                 print("Location: ${loc['Location']}");
                      return Card(
                        child: Column(
                          children: [
                            Text("data"),
                            Text(loc['Location']),
                          ],
                        ),
                      );
            });
          
                        
         
       
         
          },
      ),
    );
  }
}
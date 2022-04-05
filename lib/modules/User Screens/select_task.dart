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
         stream: FirebaseFirestore.instance.collection("worker").snapshots(),
          
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
             itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, i){
                 DocumentSnapshot workerlist = snapshot.data!.docs[i];
                //  print("Location: ${workerlist['Location']}");
                      return Card(
                        child: ListTile(
                         leading: CircleAvatar(
                           radius: 40,
                         ),
                         title: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           Row(
                             children: [
                               Text(workerlist['firstname']),
                               SizedBox(width: 5,),
                               Text(workerlist['lastname']),
                             ],
                           ),
                            Text("Address: ${workerlist['address']}", 
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                            ),
                            ),
                            Text(workerlist['city'].toString()),
                      
                         ]),
                         trailing: IconButton(icon: Icon(Icons.location_on), 
                         onPressed: (){},
                         ),
                        ),
                      );
            });
          
                        
         
       
         
          },
      ),
    );
  }
}
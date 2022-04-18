import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
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

 var lati,longi;
 var skill,service1,service12,service13,service14,service2,service22,service23,service24,service3,service32,service33,service34;


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
         stream: FirebaseFirestore.instance.collection("worker_skill").snapshots(),
          
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
                      return GestureDetector(
                        onTap:(){
                             Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Nearby(
                                    
                                 skill= workerlist['SkillName'],
                                 service1= workerlist['key']['Service'],
                                 service12= workerlist['key']['description'],
                                 service13= workerlist['key']['Price'],
                                 service14= workerlist['key']['time'],

                                 service2= workerlist['key1']['Service'],
                                 service22= workerlist['key1']['description'],
                                 service23= workerlist['key1']['Price'],
                                 service24= workerlist['key1']['time'],
                                 
                                  service3= workerlist['key2']['Service'],
                                 service32= workerlist['key2']['description'],
                                 service33= workerlist['key2']['Price'],
                                 service34= workerlist['key2']['time'],
                                    ),
                                  ));
                        },
                        child: Card(
                          child: ListTile(
                           leading: CircleAvatar(
                             radius: 40,
                           ),
                           title: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(workerlist['SkillName'],
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.blue.shade900,
                               ),),
                             Row(
                               children: [
                                 Text(workerlist['firstname']),
                                 SizedBox(width: 5,),
                                 Text(workerlist['lastname']),
                               ],
                             ),
                             
                              Text(workerlist['city'].toString()),
                        
                           ]),
                           trailing: IconButton(icon: Icon(Icons.location_on), 
                           onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LiveLocation(
                                    
                                 lati= workerlist['lat'],
                                 longi= workerlist['long'],
                                 
                                    ),
                                  ));
                           },
                           ),
                          ),
                        ),
                      );
            });
          
                        
         
       
         
          },
      ),
    );
  }
}
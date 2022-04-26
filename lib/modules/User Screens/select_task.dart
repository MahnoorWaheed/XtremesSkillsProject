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



  var skillname,worker_token;



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
         stream: FirebaseFirestore.instance.collection("worker_skills").snapshots(),
          
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
             itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, i){
                 String? token;
                  try{
                    token = snapshot.data!.docs[i].get('worker_token');
                  }catch(e){
                    print("error");
                  }
                 DocumentSnapshot workerlist = snapshot.data!.docs[i];
                //  print("Location: ${workerlist['Location']}");
                      return GestureDetector(
                        onTap:(){
                          print("array");
                          print(workerlist['services']);
                             Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Nearby(
                                     
                                      
                                      workerlist['services'],
                                      skillname = workerlist['skillname'],

                                      worker_token = token!,
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
                               Row(
                                 children: [
                                  Text('Skills : '),
                                 SizedBox(width: 5,),
                                   Text(workerlist['skillname'],
                                   style: TextStyle(
                                     fontSize: 16,
                                     color: Colors.blue.shade900,
                                   ),),
                                 ],
                               ),
                             Row(
                               children: [
                                 Text('Name : '),
                                 SizedBox(width: 5,),
                                 Text(workerlist['firstname']),
                                 SizedBox(width: 5,),
                                 Text(workerlist['lastname']),
                               ],
                             ),
                             
                              Row(
                                children: [
                                   Text('City : '),
                                 SizedBox(width: 5,),
                                  Text(workerlist['city'].toString()),
                                ],
                              ),
                        
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
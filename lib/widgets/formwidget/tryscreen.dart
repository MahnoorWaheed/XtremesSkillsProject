// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TryScreen extends StatefulWidget {
//     final String param0;
//  Map<String, dynamic> Service1;

//   var param1;

  
//   const TryScreen(this.param0, this.param1, );

//   @override
//   State<TryScreen> createState() => _TryScreenState();
// }

// class _TryScreenState extends State<TryScreen> {



// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("skill name : ${param0}");
// print("services : ${param1}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//                   leading: Icon(Icons.people),
//                   title: Text('Service Details'),
//                   centerTitle: true,
//                   actions: [
//                     IconButton(
//                       onPressed: (){},
//                       //widget.onDelete,
//                       icon: Icon(Icons.delete),
//                     )
//                   ],
//                 ),
//       body:StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("worker_details").snapshots(),
//                 builder: (context,snapshot){
//                   if(!snapshot.hasData){
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return 
                  
//                   ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (ctx,index){
//                        String? token;
//                   try{
//                     token = snapshot.data!.docs[index].get('userFCM_token');
//                   }catch(e){
//                     print("error");
//                   }
//                     DocumentSnapshot worker_details=snapshot.data!.docs[index];
//                   return Column(
//                          children: [
//                            Text(worker_details['HM1']['time'].toString()),
//                            Text(worker_details['HM1']['Price'].toString()),
//                          ],
//                       );
                   
//                   });
//                 }));
    
//   }
// }
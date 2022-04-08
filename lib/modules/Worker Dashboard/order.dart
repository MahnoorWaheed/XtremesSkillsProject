import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/utils/utils.dart';


class Order extends StatelessWidget {
   Order({ Key? key }) : super(key: key);

final List<String> clientsName=["Luqman", "Ahmed", "Salman", "Ali ","Mustafa", "Qureshi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Customer order"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},),
      ),
    body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("orders").snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx,index){
                    DocumentSnapshot orders=snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: 
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                                CircleAvatar(
                radius: 25,
                child: Image.asset("assets/logo.png"),) ,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Customer Name: ${orders['name']}'),
                      Text('Description: ${orders['description']}')
                  ],
                ),
                Column(
                  children: [
                     ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                  onPressed: (){}, 
                child: Text("Accept")),
                //SizedBox(width: 5,),
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: (){}, 
                child: Text("Decline"),)
                  ],
                )
                             ],
                           ),
                         )
                    
                    ),
                  );
                  });
                }));
               
  }
    
    
    // ListView.builder(
    //   itemCount: clientsName.length,
    //   itemBuilder: (ctx, index){
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       height: screenHeight(context)*0.2,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //         // BoxShadow(
    //         //   blurRadius: 1.0,
    //         // color: Colors.black,
    //         // )
    //       ]),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           CircleAvatar(
    //             radius: 25,
    //             child: Image.asset("assets/logo.png"), 
                
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(clientsName[index],), 
    //                 Text("Descriptions"),
    //               ],
    //             ),
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 primary: Colors.green
    //               ),
    //               onPressed: (){}, 
    //             child: Text("Accept")),
    //             //SizedBox(width: 5,),
    //             ElevatedButton(
    //                style: ElevatedButton.styleFrom(
    //                 primary: Colors.red,
    //               ),
    //               onPressed: (){}, 
    //             child: Text("Decline"),)
    //         ],
    //       )
    //     ),
    //   );
    // }),
    // );
  //}
}
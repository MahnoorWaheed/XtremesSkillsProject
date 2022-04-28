import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/login_otp/screen/notification.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:http/http.dart' as http;


class Order extends StatefulWidget {
   Order({ Key? key }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
final List<String> clientsName=["Luqman", "Ahmed", "Salman", "Ali ","Mustafa", "Qureshi"];
String name='';

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getchatroom();
   
  }
    void getchatroom() async{
    
    await FirebaseFirestore.instance
    .collection('worker')
    .doc(FirebaseAuth.instance.currentUser!.email)
    .get()
    .then((value) {
       setState(() {
         name= value.data()!['firstname'];
       }); // Access your after your get the data
     });
    // var id=FirebaseFirestore.instance.collection('newchat').where('users',arrayContains: username).snapshots();
    print(name);
    print('this is the name');

    //  await FirebaseFirestore.instance.collection("worker").doc('haseeb@gmail.com').get().then((map){
    //   setState(() {
        
    //     personaldata.add({
    //     'name': map['firstname'],
    
    //   });
    //   });
    // } );
   
  }
  

  sendNotification(String title, String token) async{

final data = {
  'click_action':"FLUTTER_NOTIFICATION_CLICK",
  'id': '1',
  'status': 'done',
  'message': title,
};

try{
http.Response response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),

headers: <String, String>{
  'Content-Type':'application/json',
  'Authorization': 'key=AAAAAUhtlMQ:APA91bEv2M94s6ESLHWi7bt_ytwJpHY87O7wpuIqJab9Lc8ciMstM6LSK-hfEl8p-xv9rvGdOCrpcBkPhGRTNKVJBWCJFzF28d1-ZODt_SYPUvD2hz7Od3KOiQNVRqizTXyRb-TFFBt7',
},
body: jsonEncode(<String, dynamic>{
'notification': <String, dynamic>{
  'title': title,
  'body':'accepted'},
  'priority': 'high',
  'data': data,
  'to':'$token',

}));
if(response.statusCode == 200){
  print("success");
   print(response.body);
}else{
  print("error");
}



}catch(e){}


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Customer order"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},),
      ),
    body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("orders").where('workername',isEqualTo: name).snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx,index){
                       String? token;
                  try{
                    token = snapshot.data!.docs[index].get('userFCM_token');
                  }catch(e){
                    print("error");
                  }
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
                  onPressed: (){
               

                  sendNotification("Order", token!);



                  }, 
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
}
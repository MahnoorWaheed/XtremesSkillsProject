import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({ Key? key }) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
   final userRef=FirebaseFirestore.instance.collection('chatroom');

  @override
  void initState() {
    // TODO: implement initState
    
   
  }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        title:  const Center(
          child: Text(
            "chatroom",
            style:  TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: "Times New Roman"),
          ),
      
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.of(context).pop();
            
          },
        ),
        actions: const <Widget>[
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            
               height: 690,
               child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('chatroom').doc('shahzadmuhib').collection('chats').orderBy("time",descending: false).snapshots(),
                 builder: (context, snapshot) {
                   if(!snapshot.hasData){
                     return const Center(
                       child: CircularProgressIndicator(),
                       
                     );
                   }
                   return ListView.builder(
                     itemCount:  snapshot.data!.docs.length,
                     itemBuilder: (ctx,index){
                       DocumentSnapshot chats=snapshot.data!.docs[index];
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                     
                         child: Container(
                           child: Column(
                             children: [
                              //  Text(chats[index]);
                              Center(child: Text(chats['message'])
                              ),
                              
                               
                            
                             ],
                           ),
                         ),
                       );

                   });
                   
                 }) ,
            
            ),
           
          ],
        ),
      ),
    );
  }
}

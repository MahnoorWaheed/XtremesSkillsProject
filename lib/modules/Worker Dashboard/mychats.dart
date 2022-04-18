import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/User%20Screens/userchat.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  
  String name='';
  
 List<Map<String,dynamic>> personaldata=[];
  @override
  void initState() {
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
  
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body:  StreamBuilder(
                  stream:FirebaseFirestore.instance.collection('newchat').where('users',arrayContains: name).snapshots(), 
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('has data');
                      print(name);
                     
                      return ListView.builder(
                          itemCount:
                              (snapshot.data as QuerySnapshot).docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ChatRoomTile(
                              (snapshot.data as QuerySnapshot)
                                  .docs[index]["chatroomid"]
                                  .toString()
                                  .replaceAll("_", "")
                                  .replaceAll(name, ""),
                                   (snapshot.data as QuerySnapshot)
                                  .docs[index]["chatroomid"],
                                  name
                           
                            );
                          });
                    }
                    return Container();
                  },
                )
      // StreamBuilder<QuerySnapshot>(
      //                 stream: FirebaseFirestore.instance.collection('newchat').where('users',arrayContains: name).snapshots(), 
      //                 // FirebaseFirestore.instance.collection('newchat').doc(widget.chatid).collection('chats').orderBy("time",descending: false).snapshots(),
      //            builder: (context, snapshot) {
      //              if(!snapshot.hasData){
      //                return const Center(
      //                  child: CircularProgressIndicator(),
      //                );
      //              }
      //              return ListView.builder(
      //                itemCount:  snapshot.data!.docs.length,
      //                itemBuilder: (ctx,index){
      //                  DocumentSnapshot chats=snapshot.data!.docs[index];
      //                return ChatRoomTile()

      //              });
                   
      //            }) ,
              
        
    );
  }
}


class ChatRoomTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  final String Cuser;
  ChatRoomTile(this.userName, this.chatRoomId,this.Cuser
  );
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () {
       
        
        log(userName);
        log(chatRoomId);
         Navigator.of(context).push(
         MaterialPageRoute(builder: (_)=> UserChat(chatid: chatRoomId, current_name: Cuser ))
                                            );
       
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue,
              ),
              child: Text("${userName.substring(0, 1).toUpperCase()}"),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              userName,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

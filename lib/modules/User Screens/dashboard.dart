// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/location.dart';
import 'package:xtremes_skills/modules/User%20Screens/select_task.dart';
import 'package:xtremes_skills/modules/User%20Screens/selectservice.dart';
import 'package:xtremes_skills/modules/User%20Screens/userchat.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/mychats.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/review.dart';
import 'package:xtremes_skills/modules/login_otp/screen/notification.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/login_text_field.dart';


class DasboardUser extends StatefulWidget {
  const DasboardUser({ Key? key }) : super(key: key);

  @override
  State<DasboardUser> createState() => _DasboardUserState();
}

class _DasboardUserState extends State<DasboardUser> {
 
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  
    
     FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
      
    });
    
  }
  
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
  
          child: Stack(
            overflow:Overflow.visible,
            children: [
              Container(
                
                height: MediaQuery.of(context).size.height,
                child: ListView(
                 children:[Container(
                   
                          decoration:BoxDecoration(
                            color:Colors.blue.shade900,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Column(children: [
                                  Container(
                                    
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 25, bottom: 10),
                                    child: Text(
                                      "Find The Best Service !",
                                      style: GoogleFonts.poppins(
                                        fontSize: MediaQuery.of(context).size.height*0.023,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        
                                      ),
                                    ),
                                  ),
                                ]),
                                Container(
                                  margin: EdgeInsets.only(left:15,right:15,bottom:15

                                      ,top:5),
                                  child:
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(() => searchfilter());
                                    },
                                    child:
                                    Container(
                                      width: MediaQuery.of(context).size.height,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),

                                      height:
                                      MediaQuery.of(context).size.height * 0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          )),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Let\'s get things done today..',
                                            style: GoogleFonts.poppins(color:Colors.black54),),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                 

                          ),
                        ),
         
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height,
                          child: StreamBuilder<QuerySnapshot>(
                             stream: FirebaseFirestore.instance.collection("Skills").snapshots(),
                              
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        // crossAxisSpacing: 1.0,
                                        // mainAxisSpacing: 1.0
                                        ),
                                    scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                       DocumentSnapshot skills = snapshot.data!.docs[index];
                        
                                      return  Container(
                          
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              
                               GestureDetector(  onTap: () {
                                 
                                        log(skills['Name']);
                                        Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_)=> NearbyWorkers(
                                                skillname: skills['Name'],
                                              ))
                                            );
                                       },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                    
                                  child: Card(
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ClipRRect(
                                          child: Image.network(
                                            skills['Image'],
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context).size.height * 0.17,
                                           
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            
                                        Text(
                                          skills['Name'],
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Times New Roman'),
                                        ),
                                      //   GestureDetector(
                                      //     onTap: (){
                                            
                                      //       log(skills['wname']);
                                             
                                        
                                      //  log(personaldata[index]['name']);
                                            
                                      //       String roomId = chatRoomId(skills['wname'], personaldata[index]['name']);
                                      //       log('success');
                                      //       log(roomId);


                                      //       Navigator.of(context).push(
                                      //         MaterialPageRoute(builder: (_)=> UserChat(chatid: roomId, current_name: personaldata[index]['name'], ))
                                      //       );
                                      //         createchatroom(skills['wname'],personaldata[index]['name'],roomId);

                                      //       // FirebaseFirestore.instance.collection('chats').doc(skills['email']).set({
                                      //       //           'chatid':roomId,
                                      //       //           'workername':skills['wname'],
                                      //       //           'username': personaldata[index]['name']
                                      //       // });
                                      //   //  Get.to(BottomNav());
                                                   
                                      //     },
                                      //     child: Icon(Icons.chat,),
                                      //     )
                                          ],
                                        )
                        
                                      
                                      ],
                                    ),
                                  ),
                                
                                ),
                              ),
                            ],
                          ),
                                            );
                                         
                                    }
                                   
                                    );
                                            
                             
                           
                             
                              },
                          ),
                        ),
                        //  const Spacer(),
                        ])
               
              ),
            ],
          ),
        ),
       
      ),
    );
  }
}
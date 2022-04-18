

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/earning_container.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/worker_info_container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore firestore= FirebaseFirestore.instance;
 final FirebaseAuth auth = FirebaseAuth.instance;
 List<Map<String, dynamic>> personaldata = [];
 bool Loading=true;
 bool imagesuccessfull=false;
 var loadimage = false;
  File? _image;
     final pickedFile = ImagePicker();
     String? downloadURL;
     String image='';

// storeNotificationToken(){
//   ScrollDragController.momentumRetainStationaryDurationThreshold
// }
   Future chooseimage() async {
      log('call');
    final pick = await pickedFile.pickImage(source: ImageSource.gallery);
    if (pick != null) {
      _image = File(pick.path);
      uploadImage();
    }
    loadimage = true;
  }

/*  upload image to the firebase storage  and get the url and
    add the url to firestore database
    
*/
  Future uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("dasborad/chats")
        .child("post_$postID");
    await ref.putFile(_image!);
    log('its ok');
    downloadURL = await ref.getDownloadURL(); 
    if (downloadURL!.isNotEmpty) {
     
    FirebaseFirestore.instance.collection('image').doc(FirebaseAuth.instance.currentUser!.email).set({
      'image':downloadURL,
    });

      downloadURL = "";
    }
  }


  @override
   initState() {
  
    super.initState();
  FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onMessage.listen(((event) {
    print("FCM message received");
  }));
  getImage();
    getCurrentUser();
  
    
  }
   Future getImage() async{
     await firestore.collection('image').doc(auth.currentUser!.email).get().then((value) {
          image=value['image'];
          imagesuccessfull=true;

     });
     log(image);
   }
  
   getCurrentUser() async {
     log(auth.currentUser!.uid);
    await firestore
        .collection("worker")
        .doc(auth.currentUser?.email)
        .get()
        .then((map) {
      setState(() {
        personaldata.add({
          "fname": map['firstname'],
          "lname": map['lastname'],
          "cnic": map['cnic'],
          "ph": map['phone'],
          "email": map['email'],
          
        });
        Loading=false;
        
        
      });
    });
    log("scuccessful");
    
  }
 
  @override
  Widget build(BuildContext context) {
    String data;
    return Scaffold(
      
      body: Loading ? const Center(child: CircularProgressIndicator(),)
      :SingleChildScrollView(
        child: SafeArea(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                //  Text("Ali khan", 
                //  style: GoogleFonts.poppins(),
                //  ),
                    Container(
                    
                      child: Flexible(
              child: ListView.builder(
                
                  itemCount: personaldata.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                      return   Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(children: [
                        
                          Text(personaldata[index]['fname'],style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                          Text(personaldata[index]['lname'],style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                        ],)
                      );
                      
                  })),
                    ),
                  

               Stack(
                 children: [
                   
                     Container(
// color: Colors.blue,
                     height: 100,
                     width: 120,

                   child: Padding(
                     
                     padding: const EdgeInsets.only(right: 50),
                     child: CircleAvatar(radius: 25,
                     backgroundImage: imagesuccessfull?NetworkImage(image):NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fsaiuniversity.edu.in%2Fteam%2Fsunita-kikeri%2F&psig=AOvVaw0SN0l_oA4hXRJh8kyK-hMn&ust=1650351364903000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLCsiYmEnfcCFQAAAAAdAAAAABAa'),
                     ),
                   ),
                 ),
                 Positioned(
                     top: 70,
                     left: 50,
                     child: GestureDetector(
                       onTap: (){
                          chooseimage();
                       },
                       child: Container(child: Icon(Icons.add_a_photo,size: 20,)))),
                 ],
               )
               ],              
             ),
             Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight(context)*0.20,
        width: screenWidth(context),
        decoration: BoxDecoration(
      color: Colors.blue.shade900,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 3
        )
      ]
        ),
  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("Personal Information",
          style: GoogleFonts.poppins(color: Colors.white),
          ),
          Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Email:",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['email'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),
                      Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("CNIC:",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['cnic'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),
                         Container(
                      
                        child: Flexible(
                child: ListView.builder(
                    itemCount: personaldata.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                        return   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Phone Number",style: GoogleFonts.poppins(color: Colors.white),),
                            Text(personaldata[index]['ph'],style: GoogleFonts.poppins(color: Colors.white),),
                          ],)
                        );
                        
                    })),
                      ),

                //      Container(
                      
                //         child: Flexible(
                // child: ListView.builder(
                //     itemCount: personaldata.length,
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //         return   Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //             Text("ADDRESS:",style: GoogleFonts.poppins(color: Colors.white),),
                //             Text(personaldata[index]['address'],style: GoogleFonts.poppins(color: Colors.white),),
                //           ],)
                //         );
                        
                //     })),
                //       ),

          
        ],)
      ),
    ),
             
            const WorkerInfo(),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Earnings"),
            ),
          
          const EarningContainer(),
       const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("To-Dos"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: screenHeight(context)*0.09,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black,
                    blurRadius: 3.0
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text("0 unread messages", 
                    style: GoogleFonts.poppins(color: Colors.white), 
                    ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ratings"),
            ),
           ],
         ),
           ),
      ),
      
    );
  }
}


// StreamBuilder<QuerySnapshot>( 
//         stream: firestore.collection("worker").snapshots(),
//         builder: (context, snapsot){
//           if(!snapsot.hasData){
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } 
        
//           // Text("${workerdata['firstname']}"),
//           return ListView.builder(
            
//             itemCount: snapsot.data!.docs.length,
//             itemBuilder: (context, index){
//               DocumentSnapshot workerdata= snapsot.data!.docs[index];
//               return Container(
//                 child: 
//               );

//             }
//             );
//         },
//       ) 





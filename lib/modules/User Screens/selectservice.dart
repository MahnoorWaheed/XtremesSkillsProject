import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
import 'package:xtremes_skills/modules/User%20Screens/place_order.dart';
import 'package:xtremes_skills/modules/User%20Screens/userchat.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';


class Nearby extends StatefulWidget {

List workerlist;
String skillname;
 // String worker_token;
String workername;
 Nearby(this.workerlist, 
 this.skillname,this.workername
 // this.worker_token,

 );

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {

  var total_amount, worker_token, name;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDocs();
    // print(widget.skillname.toString());
     getPhone();
 
   
  }
  void getPhone() async{
    
  // var num = await FirebaseAuth.instance.currentUser!.phoneNumber;
  // print(num);
    await FirebaseFirestore.instance.collection("customer").doc(FirebaseAuth.instance.currentUser!.phoneNumber).get().then((value){
      // setState(() {
        
      //   personaldata.add({
      //   'name': map['name'],
      //    'number':map['number'],
      // });
      // });
       setState(() {
          name= value.data()!['name'];
       });
       log(name);
    } );
  
}
String chatRoomId(String user1,String user2){
   if(user1[0].toLowerCase().codeUnits[0]>
      user2.toLowerCase().codeUnits[0]   
   ){
     return "$user1$user2";
   }
   else{
     return "$user2$user1";
   }
 }
 void createchatroom(String workername,currentname,id ){
    
    List<String> users=[workername,currentname];
    Map<String,dynamic> ChatRoomMap={
      'users':users,
       'chatroomid':id
    };
    FirebaseFirestore.instance.collection('newchat').doc(id).set(ChatRoomMap);
   

  }
// var sum;


// void add(price1){
// print(price1);
// for(int i=0; i<price1.length;i++){
// sum+=price1;
// setState(() {
//   sum;
// });
// }
// print(sum);
// }

// print("array receive");

bool valuefirst = false;  
  bool valuesecond = false; 
    bool valuethird = false; 
     bool valuefourth = false; 
    String codeDialog = '';
  String valueText = ''; 

    bool _checkboxListTile = false;
     int total = 0;
      int addval = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
         title: Text(widget.skillname),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
               print(widget.workername);
               print(name);
                                             
                                        
                                     
                                            
                                            String roomId = chatRoomId(widget.workername, name);
                                       


                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_)=> UserChat(chatid: roomId, current_name: name ))
                                            );
                                              createchatroom(widget.workername,name,roomId);

                                            // FirebaseFirestore.instance.collection('chats').doc(skills['email']).set({
                                            //           'chatid':roomId,
                                            //           'workername':skills['wname'],
                                            //           'username': personaldata[index]['name']
                                            // });
                                        //  Get.to(BottomNav());
            },
            icon: Icon(Icons.chat),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Card(
                                 color: Colors.blue.shade900,
                                 elevation: 5,
                                  child: ListTile(
                                    
                                                        title:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Total Amount :",
                                                            style: TextStyle(
                                                            color: Colors.white ),),
                                                           
                                                        //     Text("Quantity",style: TextStyle(
                                                        // color: Colors.white )),
                                                        //       Text("Unit Price",style: TextStyle(
                                                        // color: Colors.white )),
                                                          Text("$total . Rs",style: TextStyle(
                                                        color: Colors.white )),
                                                         ElevatedButton(onPressed: (){
                                                            Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlaceOrder(
                                      total_amount = total,
                                      //  worker_token = widget.worker_token,

                                      
                                    ),
                                  ));
                                                         }, child: Text("Place Order"))
                                                          ],
                                                        ), 
                                                                                                             
                                                       
                                                            ),
                                ),
        
    
        ),

body: Card(
  child: ListView.builder(
  
    itemCount: widget.workerlist.length,
  
    itemBuilder: (context, index){
  
      // String service = widget.workerlist[index]['Service'];
  
      return    Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [                 
                        CheckboxListTile(                        
                        secondary: const Icon(Icons.electrical_services, color: Colors.blue,),  
                        title: Text(widget.workerlist[index]['Service'],
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),                      
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(widget.workerlist[index]['description'],
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                        Row(
                          children: [
                             Text('Time :',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                        SizedBox(width: 10,),
                         Text(widget.workerlist[index]['description'],
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                          ],
                        ),
                         Row(
                          children: [
                             Text('Price :',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                        SizedBox(width: 10,),
                         Text(widget.workerlist[index]['Price'],
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                          ],
                        ),           
                           
//                             
                          ],
                        ), 
                       value:widget.workerlist[index]['value'],
                       onChanged: (value) {
                       setState(() {
                      widget.workerlist[index]['value'] = value;
                      if(value==true){
                          addval = int.parse(widget.workerlist[index]['Price']); 
                          total += addval; 
                         
                      }
                          print(addval);
                          print("total value");
                          print(total);
                        
                          }); 
               
                         }),
                       
                        ]
                      )
                    ),
                  ),
      );
  
      
  
      
  
    
  
    }),
)

   
    );
  }
}
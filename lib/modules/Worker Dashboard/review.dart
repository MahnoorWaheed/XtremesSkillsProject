import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/utils/utils.dart';

class Review extends StatefulWidget {
  const Review({ Key? key }) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final FirebaseAuth auth= FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name='';
  // List<Map<String, dynamic>> personaldata = [];

  // final List<String> names=["Luqman", "Ahmed", "Salman", "Ali ","Mustafa", "Qureshi"];
  // final List<String> days=["8 days ago","4 days ago","5 days ago","8 days ago","1 days ago"," Now"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname();
  }
   void getname() async{
    
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
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        //color: Colors.red,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Text("Reviews",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
                ),
              ),
             

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("reviews").where('workername',isEqualTo: name).snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx,index){
                    DocumentSnapshot customer_review=snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: screenWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 25,
                                child: Image.asset("assets/logo.png",),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                Text(
                                  
                                  customer_review['name'],
                                // personaldata[index]['fname'], 
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700
                                ),
                                ),
                                 Text("Report",
                                 style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  
                                ),
                                 )
                              ],
                            ),
                            Column(
                              
                              children: [
                           
                                Row(
                                
                                  children: List.generate(5, (index) => IconButton(onPressed: (){}, icon: index < customer_review['rating'] ?const Icon(Icons.star,size: 15,):const Icon(Icons.star_border_outlined, size: 15))),
                                ),
                                
                                Container(
                                  width: 200,
                                  margin:const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(customer_review['review'],
                                   style: GoogleFonts.poppins(fontSize: 13),
                                   maxLines: 4,
                                   overflow: TextOverflow.ellipsis,
                                   ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                  );
                });
                },
                )
                
              )
            ],
          ),
        ),
   
      ),
    );
  }
}

class StarRow extends StatelessWidget {
  const StarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
      ],
    );
  }
}
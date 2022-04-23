import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
import 'package:xtremes_skills/modules/User%20Screens/place_order.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';


class Nearby extends StatefulWidget {

List workerlist;
String skillname;

 Nearby(this.workerlist, 
 this.skillname

 );

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDocs();
    // print(widget.skillname.toString());
 print("array receive");
 
    print(widget.workerlist[0]);
   
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
            onPressed: (){},
            icon: Icon(Icons.chat),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: screenHeight(context)*0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Total Amount",
                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.blue.shade900
                                  ),
                  ), 
                  // Text(widget.service13+widget.service23+widget.service33, 
                  // style: GoogleFonts.poppins(
                  //                   fontSize: 16, fontWeight: FontWeight.bold,
                  //                   color: Colors.blue.shade900
                  //                 ),
                ]),
                ],
              ),
              // ActionButton(ontap: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PlaceOrder()));
              // }, text: "Place order", 
              // bordersidecolor: Colors.transparent,
              // color: Colors.blue.shade900,
              // )
       
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
                       value:widget.workerlist[index]['value'] as bool,
                       onChanged: (value) {
                       setState(() {
                      widget.workerlist[index]['value'] = value;
                              
                          }); 
                //             myALLadd({
                //           "service": "${widget.Service2}",
                //           "des": "${txtdata2}",
                //           "Price": "${Price2.toString()}",
                //           "Time": "${time2.toString()}",
                //   //"timestamp": getTime
                // });
                         }),
                       
                        ]
                      )
                    ),
                  ),
      );
  
      
  
      
  
      // Container(
  
      //   child: Card(
  
      //     elevation: 10,
  
      //     child: Column(
  
      //       children: [
  
      //         Text(widget.workerlist[index]['Service']),
  
      //         SizedBox(height: 5,),
  
      //         Text(widget.workerlist[index]['description']),
  
      //         SizedBox(height: 5,),
  
      //         Row(
  
      //           children: [
  
      //              Text(widget.workerlist[index]['time']),
  
      //         SizedBox(height: 5,),
  
      //         Text(widget.workerlist[index]['Price']),
  
      //           ],
  
      //         )
  
      //       ],
  
      //     ),
  
      //   ),
  
      // );
  
    }),
)

    //  ),
      // body: SingleChildScrollView(
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
             
      //         children: [
      //           // Row(
                  
      //           //   mainAxisAlignment: MainAxisAlignment.end,
      //           //   children: [

      //           //     IconButton(onPressed: (){
      //           //       // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LiveLocation()));
      //           //     }, icon: Icon(Icons.location_on, 
      //           //     color: Colors.blue.shade900,
      //           //     )),
      //           //     Text("Location", 
      //           //     style: GoogleFonts.poppins(
      //           //       color: Colors.blue.shade900,
      //           //     ),
      //           //     )
      //           //   ],
      //           // ),
      //           Card(
      //             color: Color.fromARGB(255, 245, 245, 245),
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text("Select Services",
      //                   style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                   ),
      //                   Text("Some services are available for you...", 
      //                   style: GoogleFonts.poppins(
      //                                 fontSize: 12,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                   ), 
        
      //                   Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("${widget.service1}", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("${widget.service12}",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                            Row(
      //                              children: [
      //                                Text("timing: ${widget.service14}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                                   SizedBox(width: 20,),
      //                                Text("Price: ${widget.service13}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                              ],
      //                            ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: true , onChanged: (value){
      
      //                         })
      //                       ],
      //                     ),
      //                   ),
      
      //                   Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("${widget.service2}", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("${widget.service22}",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                            Row(
      //                              children: [
      //                                Text("timing: ${widget.service24}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                                   SizedBox(width: 20,),
      //                                Text("Price: ${widget.service23}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                              ],
      //                            ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: true , onChanged: (value){
      
      //                         })
      //                       ],
      //                     ),
      //                   ),
      //                  Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("${widget.service3}", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("${widget.service32}",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                            Row(
      //                              children: [
      //                                Text("timing: ${widget.service34}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                                   SizedBox(width: 20,),
      //                                Text("Price: ${widget.service33}",
      //                                   style: GoogleFonts.poppins(
      //                                     fontSize: 11,
      //                                     color: Color.fromARGB(255, 78, 77, 77)
      //                                   ),
      //                                   ),
      //                              ],
      //                            ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: false , onChanged: (value){
      //                           value = true;
      //                           if(value== true){
      //                             var price1;
      //                             setState(() {
      //                               price1 = widget.service33;
      //                               add(price1);
      //                             });
                                  
      //                           }
      
      //                         }),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(height: 10,),
                
      //           Card(
      //             color: Color.fromARGB(255, 245, 245, 245),
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text("Pick your services",
      //                   style:GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                   ),
      //                   Text("Some services are available for you...",
      //                   style:GoogleFonts.poppins(
      //                                 fontSize: 12,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                   ), 
        
      //                   Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("Dish Washer", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("regular dish washes, for events per hour",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                               Text("150/-",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: false , onChanged: (value){
      
      //                         })
      //                       ],
      //                     ),
      //                   ),
      
      //                   Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("Laundry", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("regular dish washes, for events per hour",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                               Text("150/-",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: false , onChanged: (value){
      
      //                         })
      //                       ],
      //                     ),
      //                   ),
      //                  Card(
      //                     elevation: 2.8,
      //                     margin: EdgeInsets.symmetric(vertical: 10),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
                                 
      //                             children: [
      //                               Text("Home Clean", 
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 16, fontWeight: FontWeight.w900,
      //                                 color: Colors.blue.shade900
      //                               ),
      //                               ),
      //                               Text("regular dish washes, for events per hour",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                              Text("150/-",
      //                               style: GoogleFonts.poppins(
      //                                 fontSize: 11,
      //                                 color: Color.fromARGB(255, 78, 77, 77)
      //                               ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Checkbox(value: false , onChanged: (value){
      //                         }),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
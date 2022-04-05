import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
import 'package:xtremes_skills/modules/User%20Screens/place_order.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';


class Nearby extends StatelessWidget {
  String? data = '';
   Nearby({ Key? key, 
  this.data
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade900,
      //   title: Text("Home Cleaning Services"),
      //   actions: [
      //     IconButton(
      //       onPressed: (){},
      //       icon: Icon(Icons.language_sharp),)
      //   ],
      // ),
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
                  Text("Rs/-300", 
                  style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900
                                  ),
                  ),
                ],
              ),
              ActionButton(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PlaceOrder()));
              }, text: "Place order", 
              bordersidecolor: Colors.transparent,
              color: Colors.blue.shade900,
              )
            ],
          ),
        )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             
              children: [
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    IconButton(onPressed: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LiveLocation()));
                    }, icon: Icon(Icons.location_on, 
                    color: Colors.blue.shade900,
                    )),
                    Text("Location", 
                    style: GoogleFonts.poppins(
                      color: Colors.blue.shade900,
                    ),
                    )
                  ],
                ),
                Card(
                  color: Color.fromARGB(255, 245, 245, 245),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Services",
                        style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                        ),
                        Text("Some services are available for you...", 
                        style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.blue.shade900
                                    ),
                        ), 
        
                        Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Dish Washer", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                 Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: true , onChanged: (value){
      
                              })
                            ],
                          ),
                        ),
      
                        Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Laundry", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                    Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: true , onChanged: (value){
      
                              })
                            ],
                          ),
                        ),
                       Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Home Clean", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                    Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: false , onChanged: (value){
      
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                
                Card(
                  color: Color.fromARGB(255, 245, 245, 245),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pick your services",
                        style:GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                        ),
                        Text("Some services are available for you...",
                        style:GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.blue.shade900
                                    ),
                        ), 
        
                        Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Dish Washer", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                    Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: false , onChanged: (value){
      
                              })
                            ],
                          ),
                        ),
      
                        Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Laundry", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                    Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: false , onChanged: (value){
      
                              })
                            ],
                          ),
                        ),
                       Card(
                          elevation: 2.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 
                                  children: [
                                    Text("Home Clean", 
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade900
                                    ),
                                    ),
                                    Text("regular dish washes, for events per hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                   Text("150/-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 78, 77, 77)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(value: false , onChanged: (value){
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
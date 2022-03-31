import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/select_task.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/custom_buttons.dart';
class PickLocation extends StatelessWidget {
  const PickLocation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pick your location"),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue.shade900,
      // ),
     body: SafeArea(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(
             child: Container(
               height: 100,
               width: 100,
             
               decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.circular(50),
                 image: DecorationImage(image: AssetImage("assets/locations.jpg", 
                 
                 ), 
                 fit: BoxFit.fill
                 )
               ),
               
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(top:40.0),
             child: Text("Find Skill ful Workers near you!..", 
             
             style: GoogleFonts.poppins(
               fontWeight: FontWeight.bold,
               fontSize: 16
             ),
             ),
           ),
           SizedBox(height: 10,),
           Container(
             width: screenWidth(context)*0.7,
             child: Text(
               
               "By allowing location access, you can search for workers near you and receive more accurate service",
                 style: GoogleFonts.poppins(
               
               fontSize: 10
             ),
             textAlign: TextAlign.center,
               ),
           ),
  
          SizedBox(height: 100,),
           ActionButton(
            
             ontap: (){
               showDialog(
                 context: context,
                  builder: (ctx){
                    return AlertDialog(
                      title: Text("Allow Location to Access your location?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15

                            ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      actions: [
                        Column(
                          children: [
                            Divider(),
                            Text("Allow While using App", 
                            
                            style: GoogleFonts.poppins(
                              color: Colors.blue
                            ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NearbyWorkers()));
                              },
                              child: Text("Allow Once",
                              style: GoogleFonts.poppins(
                                color: Colors.blue
                              ),
                              ),
                            ),
                            Divider(),
                            Text("Don't Allow",
                            style: GoogleFonts.poppins(
                              color: Colors.blue
                            ),
                            ),
                          ],
                        )
                      ],
                    );
                  });
             }, text: "Allow Location access", 
           bordersidecolor: Colors.white,
           color: Colors.blue.shade900,
           ),
           SizedBox(height: 30,),
           
         ],
       ),
     ),
    );
  }
}
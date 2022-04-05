import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
import 'package:xtremes_skills/modules/User%20Screens/select_task.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/custom_buttons.dart';
class PickLocation extends StatefulWidget {
  const PickLocation({ Key? key }) : super(key: key);

  

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {

String Location = "";
String address = "";

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 


  return await Geolocator.getCurrentPosition();
}


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
   Text("position: $Location"),
            Text("ADDRESS : $address" ),
          SizedBox(height: 100,),
           ActionButton(
            
             ontap: () async{
               Position position = await _determinePosition();
            Location = 'LAT: ${position.latitude}, long: ${position.longitude}';
            // GetAddressFromLatLong(position);
            
            setState(() {
              
            });
            // getCurrentLocation();

 FirebaseFirestore.instance.collection("customer").doc().set({
                                   "Location":Location 
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
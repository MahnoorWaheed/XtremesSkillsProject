import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
// import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';

import 'package:xtremes_skills/widgets/action_button.dart';

class LocationData extends StatefulWidget {
  const LocationData({ Key? key }) : super(key: key);

  @override
  State<LocationData> createState() => _LocationDataState();
}

class _LocationDataState extends State<LocationData> {

   String userName = '';
  String userEmail = '';
  bool isLoading = true;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

   getUserData() async {
    await FirebaseFirestore.instance
        .collection('worker')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((value) {
      print(value.docs.first.data()['firstname']);
      print(value.docs.first.data()['lastname']);
      print(value.docs.first.data()['email']);
      userName = value.docs.first.data()['firstname'];
      userEmail = value.docs.first.data()['email'];
    });
    setState(() {
      isLoading = false;
    });
  }


// var locationMessage = "";
// late Position currentPosition;
// var geoLocator = Geolocator();
// double bottomPaddingOfMap = 0;
// void getCurrentLocation() async {
//   var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   var lastPosition = await Geolocator.getLastKnownPosition();
//   print(lastPosition);

//   setState(() {
//     locationMessage = "$position.latitude, $position.longitude";

//   });
// }
var loctn ;
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

// Future<void> GetAddressFromLatLong(Position position) async {

// List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
// print(placemark);
// Placemark place = placemark[0];
// address = '${place.street}, ${place.subLocality}';

// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
         

            CircleAvatar(
                  radius: 60,
                    child: ClipOval(
                  
                      child: Image.asset(
                        'assets/locations.jpg',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
       SizedBox(height: 30,),
         Text("Select your Location",
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 16,
              color: Colors.black
            ),),
           SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("By allowing location access, customer can search for workers near you and receive more accurate service",
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 14,
              color: Colors.black87
            ),
            textAlign: TextAlign.center,
            
            ),
          ),
            SizedBox(height: 30,),
            Text("position: $Location"),
            Text("ADDRESS : $address" ),
          ActionButton(
            // text: "",
            ontap: () async{
            Position position = await _determinePosition();
            Location = 'LAT: ${position.latitude}, long: ${position.longitude}';
            // GetAddressFromLatLong(position);
            
            setState(() {
              
            });
            // getCurrentLocation();


 FirebaseFirestore.instance.collection('worker').doc(FirebaseAuth.instance.currentUser?.email).collection("workerskill").doc().set({



                                   "Location":Location 
                                      });
                                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> skills()));

            //  Navigator.of(context).push(MaterialPageRoute(

            //                       builder: (context) => skills(
                                 
            //                         //Location
            //                         )));


                                  // builder: (context) => skills()));


          }, text: 'Allow Location access',
          ),
            SizedBox(height: 30,),
          Text("Enter My Location"),
            SizedBox(height: 50,),
        ],
      ),
    );
  }
}
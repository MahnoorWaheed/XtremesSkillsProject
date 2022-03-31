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
          ActionButton(ontap: () async{
            Position position = await _determinePosition();
            Location = 'LAT: ${position.latitude}, long: ${position.longitude}';
            // GetAddressFromLatLong(position);
            
            setState(() {
              
            });
            // getCurrentLocation();
             Navigator.of(context).push(MaterialPageRoute(

                                  builder: (context) => skills(
                                 
                                    //Location
                                    )));

                              

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
import 'package:flutter/material.dart';
import 'package:xtremes_skills/widgets/action_button.dart';

class LocationData extends StatefulWidget {
  const LocationData({ Key? key }) : super(key: key);

  @override
  State<LocationData> createState() => _LocationDataState();
}

class _LocationDataState extends State<LocationData> {
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
          ActionButton(ontap: (){}, text: 'Allow Location access',
          ),
            SizedBox(height: 30,),
          Text("Enter My Location"),
            SizedBox(height: 50,),
        ],
      ),
    );
  }
}
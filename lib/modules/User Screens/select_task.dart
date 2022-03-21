import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/selectservice.dart';
import 'package:xtremes_skills/widgets/action_button.dart';

class NearbyWorkers extends StatelessWidget {
  String? data = '';
   NearbyWorkers({ Key? key, 
  this.data
   }) : super(key: key);
final List<String> names=["Tv installation", "House Cleaning", "Dish Washer", 
"Laundry ","Car cleaner", "Gardener"];
  final List<String> address=["DHA Peshawar","Hayatabad","Saddar","Mall Road","Abdara Road"," Kohat Road"];
 final List<String> price=["300/hr","100/hr","300/hr","100/hr","200/hr"," 300/hr"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("NearBy Workers"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.language_sharp),
            ),
        ],
      ), 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
          
            child: ListView.builder(
              itemCount: names.length,
            itemBuilder: (ctx,index)
            {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                    children: [
                      CircleAvatar(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text(names[index], 
                          style: GoogleFonts.poppins(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.location_on, size: 12,
                              ),
                              Text(address[index]),
                            ],
                          ),
                        ],),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        ActionButton(ontap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Nearby()));
                        }, text: "open",
                        bordersidecolor: Colors.blue,
                        
                        ),
                        Text(price[index]),
                      ],)
                    ],
                  ),
                ),
              );
            }
            ))
            ],
      ), 
    );
  }
}
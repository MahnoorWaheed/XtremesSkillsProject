import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/User%20Screens/location.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/login_text_field.dart';


class DasboardUser extends StatelessWidget {
  const DasboardUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text("Hi there,", 
            style: GoogleFonts.poppins(
              fontSize: 25, 
              color: Colors.blue.shade900
            ),
            ), 
            Text("Let's get things done today!" ,
             style: GoogleFonts.poppins(
              fontSize: 15, 
              
            ),
            ),
            Center(
              child: MyTextField(
               
                height: screenHeight(context)*0.06,
                width: screenWidth(context)*0.9,
                label: "Type to find a service",
                icons: Icon(Icons.search),),
            ),
            SizedBox(height: 10,),
            Card(
              color: Color.fromARGB(255, 16, 101, 170),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("New to Xtreme Skills", 
                    style: GoogleFonts.poppins(
              fontSize: 10, 
              color: Colors.white, 
              fontWeight: FontWeight.w700
            ),
                    ), 
                    Text("Book a Clean for PKR 24/hr", 
                    style: GoogleFonts.poppins(
              fontSize: 10, 
              color: Colors.white, 
              fontWeight: FontWeight.w700
            ),
                    )
                  ],), 
                  ActionButton(ontap: (){}, 
                  text: "Book now", 
                  color: Colors.blue.shade800,
                  bordersidecolor: Colors.white,
                  )
                ],
              ),
            ), 
              Text("Popular Services" ,
             style: GoogleFonts.poppins(
              fontSize: 15, 
            ),
            ),
            //TODO: ADD GRID VIEW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PickLocation()));
                  },
                  child: Container(
                        width: 150.0,
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Wrap(
                            children: <Widget>[
                              ClipRRect(
                                child: Image.network(
                                  'https://images.everydayhealth.com/images/healthy-living/healthy-home/easy-ways-to-clean-your-home-01-722x406.jpg',
                                  height: 130,
                                  // width: 100,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Home Cleaning',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Times New Roman'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
                    Container(
                      width: 150.0,
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Wrap(
                          children: <Widget>[
                            ClipRRect(
                              child: Image.network(
                                'https://media.glamour.com/photos/5695b2b593ef4b09520e4617/master/pass/sex-love-life-2013-08-moving-in-main.jpg',
                                height: 130,
                                // width: 100,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Moving',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Times New Roman'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 150.0,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.network(
                              'https://images.pexels.com/photos/1249611/pexels-photo-1249611.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              height: 130,
                              // width: 100,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Handyman',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Times New Roman'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150.0,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.network(
                              'https://media.istockphoto.com/photos/coronavirus-disinfection-people-in-hazmats-making-disinfection-in-picture-id1251021649?b=1&k=20&m=1251021649&s=170667a&w=0&h=XnwjEnbZH_SzI9M8SlVEt5LXu-IH8ScUFo8ktI2fyBc=',
                              height: 130,
                              // width: 100,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Sanitization',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Times New Roman'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ), 
          ],),
        ),
      ),
    );
  }
}
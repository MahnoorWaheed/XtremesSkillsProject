import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/rate.dart';


class skills extends StatefulWidget {
  const skills({Key? key}) : super(key: key);

  @override
  _skillsState createState() => _skillsState();
}

class _skillsState extends State<skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select your skills :'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("worker_skills").snapshots(),
        
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0),
              scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                 DocumentSnapshot skills = snapshot.data!.docs[index];

                return  Container(
                        margin: EdgeInsets.only(left: 10.0, top: 10.0),
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                            
                              child: Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Image.network(
                                        skills['Image'],
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).size.height * 0.17,
                                       
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height:  MediaQuery.of(context).size.height * 0.02,
                                    ),
                                    Center(
                                      child: Text(
                                        skills['Name'],
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Times New Roman'),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                   
              }
             
              );
       
       
     
       
        },
      ),
      
      
      
      // new GridView.count(
      //   crossAxisCount: 2,
      //   children: [
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
                  
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://images.everydayhealth.com/images/healthy-living/healthy-home/easy-ways-to-clean-your-home-01-722x406.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Home Cleaning',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://media.glamour.com/photos/5695b2b593ef4b09520e4617/master/pass/sex-love-life-2013-08-moving-in-main.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Moving',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://images.pexels.com/photos/1249611/pexels-photo-1249611.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Handyman',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://media.istockphoto.com/photos/coronavirus-disinfection-people-in-hazmats-making-disinfection-in-picture-id1251021649?b=1&k=20&m=1251021649&s=170667a&w=0&h=XnwjEnbZH_SzI9M8SlVEt5LXu-IH8ScUFo8ktI2fyBc=',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Sanitization',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://www.forbes.com/advisor/wp-content/uploads/2021/04/featured-image-hire-an-electrician.jpeg.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Electrician',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://adoptostaging.blob.core.windows.net/media/plumber-job-description-template-tQh1-P.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Plumber',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://st2.depositphotos.com/1158045/6706/i/950/depositphotos_67067531-stock-photo-mechanic-at-work-on-car.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Mechanic',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://mydecorative.com/wp-content/uploads/2020/01/event-management-by-event-planner.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'Event Planner',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     new Container(
      //       margin: EdgeInsets.only(left: 10.0, top: 10.0),
      //       height: 30,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => rate(),
      //               ));
      //             },
      //             child: Container(
      //               width: 150.0,
      //               child: Card(
      //                 elevation: 2.0,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //                 child: Wrap(
      //                   children: <Widget>[
      //                     ClipRRect(
      //                       child: Image.network(
      //                         'https://nayakam.com/wp-content/uploads/2020/09/54e564e596ba02f9482baa74eeb72bf7.jpg',
      //                         height: 130,
      //                         // width: 100,
      //                         fit: BoxFit.cover,
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(16.0),
      //                         topRight: Radius.circular(16.0),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 30,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Center(
      //                         child: Text(
      //                           'A/C Servicing',
      //                           style: TextStyle(
      //                               fontSize: 15.0,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Times New Roman'),
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

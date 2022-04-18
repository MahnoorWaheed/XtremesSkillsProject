import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/wallet_method.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({ Key? key }) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
   static const TextStyle kBlackTextStyle =
      TextStyle(color: Colors.black, );
  var price = 300;

    final FirebaseFirestore _firestore= FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Icon(Icons.arrow_back_ios),
              ),
              Text('Total Bill: Rs 300',
                  style: kBlackTextStyle.copyWith(fontSize: 17,  fontFamily: 'Montserrat',))
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/worker.jpg'),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Home Cleaner',
                        style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                    Text('2 items: Delivery Time 30 mins',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.normal,  fontFamily: 'Montserrat',)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/home.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Home Address',
                        style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                    Text(
                        'D Block Ram Nagpur Near Sai Petrol \n'
                        'Pump Ring Road Nagpur - 440001',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.normal, fontFamily: 'Montserrat',)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 25),
            height: 1,
            color: Colors.grey[350],
            width: MediaQuery.of(context).size.width - 50,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Credit/Debit Cards',
                    style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
                Text('ADD NEW CARD',
                    style: kBlackTextStyle.copyWith(
                      fontSize: 15,
                      color: Colors.blue.shade900,
                       fontFamily: 'Montserrat',
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image(image: AssetImage('assets/credit.jpg')),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '*************4356\n'
                        'Ali Khan',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.normal, fontFamily: 'Montserrat',)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 25),
            height: 1,
            color: Colors.grey[350],
            width: MediaQuery.of(context).size.width - 50,
          ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: Text('Save and Pay via cards',
                  style: kBlackTextStyle.copyWith(
                      fontSize: 12,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.normal, fontFamily: 'Montserrat',))),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/credit.jpg'),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(width: 20),
                Image(
                  image: AssetImage('assets/master.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(width: 20),
                Image(
                  image: AssetImage('assets/visa card.jpg'),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text('Wallet Method',
                style: kBlackTextStyle.copyWith(fontSize: 15, fontFamily: 'Montserrat',)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
            children: [
WalletMethod(
            image: Image(
              image: AssetImage('assets/paypal.png'),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
            ),
            title: 'Pay Pal',
          ),
          WalletMethod(
            image: Image(
              image: AssetImage('assets/jazz.png'),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
            ),
            title: 'Jazz Cash',
          ),
          WalletMethod(
            image: Image(
              image: AssetImage('assets/easypaisa.png'),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
            ),
            title: 'Easy Paisa',
          ),
            ],
          )),
          // WalletMethod(
          //   image: Image(
          //     image: AssetImage('assets/images/phone.png'),
          //     height: MediaQuery.of(context).size.height * 0.07,
          //     width: MediaQuery.of(context).size.height * 0.07,
          //   ),
          //   title: 'Phone Pay',
          // ),
          // WalletMethod(
          //   image: Image(
          //     image: AssetImage('assets/images/google.png'),
          //     height: MediaQuery.of(context).size.height * 0.07,
          //     width: MediaQuery.of(context).size.height * 0.07,
          //   ),
          //   title: 'Google Pay',
          // ),
          // WalletMethod(
          //   image: Image(
          //     image: AssetImage('assets/images/payPal.png'),
          //     height: MediaQuery.of(context).size.height * 0.07,
          //     width: MediaQuery.of(context).size.height * 0.07,
          //   ),
          //   title: 'Pay Pal',
          // ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: ActionButton(
                text: 'PAY NOW',
                bordersidecolor: Colors.blue.shade900,
                color: Colors.blue.shade900,

                ontap: () async {

  String? usertoken = await FirebaseMessaging.instance.getToken();
         _firestore.collection('orderstry').doc().set({      

                // ontap: () async{
                //   String? usertoken =await FirebaseMessaging.instance.getToken();
                //   _firestore.collection('orders').doc().set(
                //    {
                //       'name':"Muhib",
                //     'description': "hjkhjkh",
                //     'userFCM_token': usertoken,
                //    }
                //   ); 


            'name':"hammad",
            'description': "dfhfgdfhdfjjh",
            'userFCM_token': usertoken
         });

                  
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => PayNow()),
                  // );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
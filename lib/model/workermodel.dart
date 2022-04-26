// class workerdetails{
//   String servicename,desc,time,price;

// workerdetails({
//   required this.servicename,
//   required this.desc,
//   required this.time,
//   required this.price,
// });

// // mySReport({
// //   required this.itemName,
// //   required this.quantity,
// //   required this.unitPrice,
// //   required this.idtotalPrice;


// // });

//   static fromJson(i) {}

// }

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xtremes_skills/widgets/formwidget/skills_details.dart';

class WorkerModel extends ChangeNotifier {
  int counter = 0;
  String detail = "Order Successfully send";
  String order = "Your order no : ";

  // int _remainingTime = 60;
  // int getRemainingTime() => _remainingTime;

  // updateRemainingTime() {
  //   _remainingTime--;
  //   notifyListeners();
  // }


  var context;
  setCartAmount() {
    counter++;
  }

  final databaseReference = FirebaseFirestore.instance;
  List<Map<String, dynamic>> SelectedProducts = <Map<String, dynamic>>[];
  int _total = 0;
  List<Map<String, dynamic>> get selectedProducts => SelectedProducts;
  List<dynamic> myallData = [];

  // List<Map<String, String>> _customerName = List<Map<String, String>>();

  // List<Map<String, String>> get customerName => _customerName;
List<Map<String, dynamic>> workervalue = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> get worker => workervalue;
  void add(Map<String, dynamic> value) {
    SelectedProducts.add(value);

 
    data();
      createRecord(); 
    
    print("Rimsha is best");
    print(value);
    // setState({
    //    workervalue = value
    // })
   
    notifyListeners();
  }

  
void addAll(Map<String, dynamic> value1){
  workervalue.add(value1);
 
  //  myallData.add(value);
  //  print("Rimsha is best1");
  //  print(selectedProducts);

        print("Rimsha is best2");
    print(value1);
      createRecord(); 
}

data(){
     print("Rimsha is best4");
   print(selectedProducts);

}

  // void addcustomer(Map<String, String> value) {
  //   _customerName.add(value);
  //   print(value);
  //   notifyListeners();
  // }

  // removeFromCart(Map<String, String> value) {
  //   _selectedProducts.remove(value);

  //   notifyListeners();
  // }

  // removeall(Map<String, String> value) {
  //   _selectedProducts.clear();
  //   notifyListeners();
  // }

  // createRecord(total, cart) async {
  //   print("@CreateRecord/CartData");

  //   const _chars =
  //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //   Random _rnd = Random();

  //   String getRandomString(int length) =>
  //       String.fromCharCodes(Iterable.generate(
  //           length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //   var randomString = getRandomString(5); // 5GKjb

  //   cartState = ViewState.loading;
  //   await databaseReference.collection("CartData").doc(randomString).set({
  //     "cartItems": selectedProducts.toString(),
  //     "totalCost": total,
  //     "order number": randomString
  //   });
  //   print(selectedProducts.toString());
  //   notifyListeners();
  // }

  // deleteRecord(total, cart) async {
  //   _selectedProducts.clear();
  //   notifyListeners();



  // }
  //    String workerfirstName = '';
  // String workerlastname = '';
  // String workercity = '';
  // String workerlati = '';
  // String workerlongi = '';
  //  String workeremail = '';


//    getUserData() async {
//     await FirebaseFirestore.instance
//         .collection('worker')
//         .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
//         .get()
//         .then((value) {
//       print(value.docs.first.data()['firstname']);
//       print(value.docs.first.data()['lastname']);
//       print(value.docs.first.data()['email']);
//       workerfirstName = value.docs.first.data()['firstname'];
//       workerlastname = value.docs.first.data()['lastname'];
//       workercity = value.docs.first.data()['city'];
//       workerlati = value.docs.first.data()['lat'];
//       workerlongi = value.docs.first.data()['long'];
//      workeremail = value.docs.first.data()['email'];
//     });
//     // setState(() {
//     //   isLoading = false;
//     // });
//  }



createRecord() async {
    // print("@CreateRecord/CartData");
    // print('In create Record $customerName');
      print("Rimsha is best3");
       print(selectedProducts);
   
    print("Rimsha is best5");
   print(worker);
 var workeremail;
  var workerfirstName;
  var workerlastname ;
  var workercity;
  var workerlati;
  var workerlongi;
  var workerSkillname;
  var worker_token;
 

   for(var a in worker){

   workeremail = a['workeremail'];
   workerfirstName = a['firstname']; 
   workerlastname = a['lastname']; 
   workercity = a['city']; 
   workerlati = a['worker_lati']; 
   workerlongi = a['worker_longi'];
   workerSkillname = a['Skill Name'];
   worker_token = a[worker_token];
   print("workeremail");
   print(workeremail);

    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
 

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    var randomString = getRandomString(5); // 5GKjb

    // selectedProducts.add({'totalCost': total.toString()});
    //cartState = ViewState.loading;
    DateTime selectedDT = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(selectedDT);
    await databaseReference.collection("worker_skills").doc(workeremail).set({
      "workeremail":workeremail,
      "firstname": workerfirstName,
      "lastname": workerlastname,
      // "order number": randomString,
      "city":workercity,
      "lat":workerlati,
      "long":workerlongi,
      "skillname":workerSkillname,
      "worker_token":worker_token,
     
      'services': FieldValue.arrayUnion(selectedProducts),
  
      });
  print("check data");
    print(selectedProducts.toString());
    notifyListeners();
  }

  void getData() async {
    print("@getCartDataRecords");
    await for (var snapshot
        in databaseReference.collection('CartData').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
    print("read succesffully");
    notifyListeners();
  }

  // Future<void> getUserByUsername(Map<String, String> map) async {
  //   print(map);
  //   // ignore: deprecated_member_use
  //   return await FirebaseFirestore.instance
  //       .collection('Customer')
  //       .where("Name", isEqualTo: map)
  //       // ignore: deprecated_member_use
  //       .get();
  // }
}
}
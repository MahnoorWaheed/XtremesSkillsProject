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
  List<Map<String, String>> SelectedProducts = <Map<String, String>>[];
  int _total = 0;
  List<Map<String, String>> get selectedProducts => SelectedProducts;
  List<dynamic> myallData = [];

  // List<Map<String, String>> _customerName = List<Map<String, String>>();

  // List<Map<String, String>> get customerName => _customerName;
List<Map<String, String>> workervalue = <Map<String, String>>[];
  void add(Map<String, String> value) {
    SelectedProducts.add(value);

    workerdata(value);
    data();
    
    print("Rimsha is best");
    print(value);
    // setState({
    //    workervalue = value
    // })
   
    notifyListeners();
  }

  
 workerdata(Map<String, String> value){
 
  //  myallData.add(value);
   print("Rimsha is best1");
   print(SelectedProducts);

        print("Rimsha is best2");
    print(value);
}

data(){
     print("Rimsha is best4");
   print(SelectedProducts);

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

  createRecord(cart,String workerfirstName, String workerlastname, String workercity, String workerlati, String workerlongi, String skillName, String workeremail,) async {
    // print("@CreateRecord/CartData");
    // print('In create Record $customerName');
      print("Rimsha is best3");
       print(SelectedProducts);
   

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
      "skillname":skillName,
      'services': FieldValue.arrayUnion(SelectedProducts),
  
      });





















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

class User {
  String service;
  int price;
  String description;

  User({this.service = '', this.price = 1, this.description = ''});
}


//  Future<void> getUserByUsername(Map<String, String> map) async {
//     print(map);
//     // ignore: deprecated_member_use
//     return await FirebaseFirestore.instance
//         .collection('Customer')
//         .where("Name", isEqualTo: map)
//         // ignore: deprecated_member_use
//         .get();
//   }
// }


class mySReportDetails2{
  String Service,description,time,Price;

mySReportDetails2({
  required this.Service,
  required this.description,
  required this.time,
  required this.Price,
});

// mySReport({
//   required this.itemName,
//   required this.quantity,
//   required this.unitPrice,
//   required this.idtotalPrice;


// });

  static fromJson(i) {}

}
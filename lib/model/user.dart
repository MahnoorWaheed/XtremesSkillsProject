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
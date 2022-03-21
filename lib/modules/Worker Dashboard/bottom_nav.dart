import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/mychats.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/order.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/review.dart';
import 'drawar.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

   int selectedpage = 0;
  final _pageOption = [
    Dashboard(),
    Order(),
    Review(),
    MyChat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Drawer()));
        //   },
        //   icon: Icon(Icons.menu),)
      ),
      drawer: WorkerDrawer(),
      body:  _pageOption[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        
        backgroundColor: Colors.blue.shade900,
        color: Colors.white,
        items: const [
            TabItem(icon: Icons.home, title: "Home", ),
          TabItem(icon: Icons.shopping_cart, title: "Order"),
          TabItem(icon: Icons.rate_review, title: "Review"),
          TabItem(icon: Icons.chat, title: "Chat"),
        ],
        initialActiveIndex: selectedpage,
      onTap: (int index){
        setState(() {
          selectedpage=index;
        });
      },
      ),
    );
  }
}
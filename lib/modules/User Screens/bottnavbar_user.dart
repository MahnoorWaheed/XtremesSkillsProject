import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/User%20Screens/support.dart';

class UserBottomNav extends StatefulWidget {
  const UserBottomNav({ Key? key }) : super(key: key);

  @override
  State<UserBottomNav> createState() => _UserBottomNavState();
}

class _UserBottomNavState extends State<UserBottomNav> {

   int selectedpage = 0;
  final _pageOption = [
    DasboardUser(),
    UserSupport(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support "),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chat),)
        ],
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Drawer()));
        //   },
        //   icon: Icon(Icons.menu),)
      ),
      // drawer: WorkerDrawer(),
      body:  _pageOption[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        
        backgroundColor: Colors.blue.shade900,
        color: Colors.white,
        items: const [
            TabItem(icon: Icons.home, title: "Home", ),
          TabItem(icon: Icons.chat_bubble_rounded, title: "Support"),
          TabItem(icon: Icons.person, title: "Account"),
          
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
import 'package:flutter/material.dart';

class WorkerDrawer extends StatefulWidget {
  const WorkerDrawer({ Key? key }) : super(key: key);

  @override
  State<WorkerDrawer> createState() => _WorkerDrawerState();
}

class _WorkerDrawerState extends State<WorkerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Hey"), 
            accountEmail: Text("Hey"), 
            )
        ],
      ),
    );
  }
}
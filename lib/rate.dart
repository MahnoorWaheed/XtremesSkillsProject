import 'package:flutter/material.dart';


import 'modules/Worker Dashboard/multi_form.dart';

class rate extends StatefulWidget {
  const rate({Key? key}) : super(key: key);

  @override
  _rateState createState() => _rateState();
}

class _rateState extends State<rate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.greenAccent,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MultiForm(),
      ),
    );
  }
}

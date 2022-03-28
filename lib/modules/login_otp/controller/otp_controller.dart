import 'package:flutter/material.dart';

class OTPControllerScreen extends StatefulWidget {
  final String phone;
 final String codedigits;
  const OTPControllerScreen({ required this.codedigits, required this.phone});

  @override
  State<OTPControllerScreen> createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPController =TextEditingController();
  final FocusNode _pinOTPCodeFocus =FocusNode();

  String? verificationCode;
  final BoxDecoration pinOTPCodeDecoration= BoxDecoration(
    color: Colors.blue,
    border: Border.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        Padding(padding: EdgeInsets.all(8.0),
        child: Image.asset("assets/password.svg"),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
        ),
      ]),
    );
  }
}
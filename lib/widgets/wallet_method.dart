import 'package:flutter/material.dart';

class WalletMethod extends StatelessWidget {
  WalletMethod({required this.title, required this.image});
  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [image, Text(title, style: TextStyle( fontFamily: 'Montserrat',),)],
      ),
    );
  }
}
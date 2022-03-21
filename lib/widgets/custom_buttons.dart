import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGestures extends StatelessWidget {
  const MyGestures({
    Key? key,
    required this.text,
    required this.ontap
  }) : super(key: key);

final String text;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(text, 
      style: GoogleFonts.poppins(fontSize: 13, color: Colors.blue.shade900),
      ),
      onTap: ontap,
    );
  }
}


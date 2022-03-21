import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerDetailsRow extends StatelessWidget {
  const WorkerDetailsRow({
    Key? key,
    required this.text1,
    required this.text2,
    
  }) : super(key: key);

final String text1;
final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1, 
          style:GoogleFonts.poppins(color: Colors.white),
          ),
          Text(text2,
          style:GoogleFonts.poppins(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
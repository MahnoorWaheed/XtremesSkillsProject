import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningInDollars extends StatelessWidget {
  const EarningInDollars({
    Key? key,
    required this.dollars
  }) : super(key: key);

final double dollars;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("PKR $dollars", 
          style:GoogleFonts.poppins(color:Colors.white)
          ),
          Text("PKR $dollars", 
          style:GoogleFonts.poppins(color:Colors.white)
          ),
        ],
      ),
    );
  }
}
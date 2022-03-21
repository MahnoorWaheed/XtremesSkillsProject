
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarninDetailsRows extends StatelessWidget {
  const EarninDetailsRows({
    Key? key,
    required this.item,
    required this.details
  }) : super(key: key);

final String item;
final String details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5.0),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item, 
          style: GoogleFonts.poppins(
            color: Colors.white
          ),
          ),
          Text(details,
           style: GoogleFonts.poppins(
            color: Colors.white
          ),
          )
        ],
      ),
    );
  }
}

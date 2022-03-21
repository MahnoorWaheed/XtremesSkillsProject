import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/worker_detail_row.dart';

class WorkerInfo extends StatelessWidget {
  const WorkerInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight(context)*0.20,
        width: screenWidth(context),
        decoration: BoxDecoration(
      color: Colors.blue.shade900,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 3
        )
      ]
        ),
  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("Here's how you're doing..",
          style: GoogleFonts.poppins(color: Colors.white),
          ),
          WorkerDetailsRow(
            text1: "Seller Level",
            text2: "New Seller",
          ),
           WorkerDetailsRow(
            text1: "Next Evaluation",
            text2: "21 Dec, 2021",
          ),
           WorkerDetailsRow(
            text1: "Response Time",
            text2: "Average 1 Hour",
          ),
        ],)
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:xtremes_skills/utils/utils.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/dollars_row.dart';
import 'package:xtremes_skills/widgets/worker_dashboard_widgets/earning_details_row.dart';

class EarningContainer extends StatelessWidget {
  const EarningContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          boxShadow: const [
            BoxShadow(color: Colors.black, 
            blurRadius: 3.0
            ),
          ],
          borderRadius: BorderRadius.circular(10)
        ),
        height: screenHeight(context)*0.25,
        width: screenWidth(context),
        
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            EarninDetailsRows(
              item: "Personal Balance",
              details: "Earnings In December",
            ),
            EarningInDollars(
              dollars: 100,
            ),
             EarninDetailsRows(
              item: "Avg. Selling Price",
              details: "Selling Price",
            ),
              EarningInDollars(
              dollars: 2500,
            ),
             EarninDetailsRows(
              item: "Pending Clearance",
              details: "Cancelled Oreder",
            ),
              EarningInDollars(
              dollars: 0,
            ),
          ],
        )),
      );
  }
}
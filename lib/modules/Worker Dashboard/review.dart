import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/utils/utils.dart';

class Review extends StatefulWidget {
  const Review({ Key? key }) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  final List<String> names=["Luqman", "Ahmed", "Salman", "Ali ","Mustafa", "Qureshi"];
  final List<String> days=["8 days ago","4 days ago","5 days ago","8 days ago","1 days ago"," Now"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        //color: Colors.red,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Text("Reviews",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
                ),
              ),
             

              Expanded(
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (ctx,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: screenWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset("assets/logo.png",),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(days[index], 
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                                ),
                                Text(names[index], 
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700
                                ),
                                ),
                                 Text("Report",
                                 style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  
                                ),
                                 )
                              ],
                            ),
                            Column(
                              children: [
                                StarRow(),
                                Container(
                                  width: 200,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text("With the internet,"
                                   "We are no longer confined to just friends, family,"
                                   "and coworkers—we can see what people all . ",
                                   style: GoogleFonts.poppins(fontSize: 10),
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                   ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                  );
                }),
              )
            ],
          ),
        ),
   
      ),
    );
  }
}

class StarRow extends StatelessWidget {
  const StarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
        Icon(Icons.star_border_outlined, size: 15,),
      ],
    );
  }
}
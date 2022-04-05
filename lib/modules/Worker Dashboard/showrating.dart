import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowRating extends StatefulWidget {
  final double rating;
  const ShowRating({ Key? key,required this.rating }) : super(key: key);

  @override
  State<ShowRating> createState() => _ShowRatingState();
}

class _ShowRatingState extends State<ShowRating> {
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dkfajjfklj"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: List.generate(5, (index) => IconButton(onPressed: (){}, icon: index < widget.rating ?Icon(Icons.star,size: 32,):Icon(Icons.star_border)))
            )
            
//              RatingBar.builder(
//    initialRating: ,
//    minRating: 1,
//    direction: Axis.horizontal,
//    allowHalfRating: false,
//    itemCount: 5,
//    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//    itemBuilder: (context, _) => Icon(
//      Icons.star,
//      color: Colors.amber,
//    ),
//    onRatingUpdate: (value) {
   
//    },
// ),
          )

        ],
      ),
    );
  }
}
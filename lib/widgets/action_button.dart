import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.ontap,
    required this.text,
     this.height,
     this.width,
    this.color,
    this.bordersidecolor,
    this.textColor
  }) : super(key: key);

final String text;
final VoidCallback ontap;
final double? height;
final double? width;
final Color? color;
final Color? bordersidecolor;
final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height: height,
    
      child: ElevatedButton( 
      //Elevation Button For Get Started
        style: ElevatedButton.styleFrom(
          
          primary: color, //background color of button
      //  side: BorderSide(width:1, 
      //  color:bordersidecolor!), //border width and color
       elevation: 2, //elevation of button
        shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10)
       ),
        ),
      onPressed: ontap,    
       child: Text(text,
       style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,
      color: textColor,
      ),
       ),),
    );
  }
}


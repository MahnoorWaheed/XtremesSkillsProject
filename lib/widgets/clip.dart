import 'package:flutter/material.dart';



class MyClipPath extends StatelessWidget {
  final Color backgroundColor = Colors.purple;
  @override

  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
       decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
               colors: [
                 Colors.blue.shade900,
                  Colors.blue.shade500,
                  ],),
                  ),
        // width: 400,
        height: MediaQuery.of(context).size.height*0.3,
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override

  Path getClip(Size size) {
     Path path = Path();
    path.lineTo(0, size.height);
    
    path.quadraticBezierTo(size.width/6, size.height - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height, size.width, size.height-30);
  //  path.quadraticBezierTo(size.width/4, size.height - 40, size.width/2, size.height-20);
    //path.quadraticBezierTo(3/4*size.width, size.height, size.width, size.height-30);
   // path.quadraticBezierTo(size.width/4, size.height - 40, size.width/2, size.height-20);

  
    path.lineTo(size.width, 0);

    return path;
  }
  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
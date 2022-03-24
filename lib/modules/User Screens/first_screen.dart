import 'package:flutter/material.dart';

import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/first_screen.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/clip.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyClipPath(),
          Image.asset("assets/logo.png", 
           fit: BoxFit.contain,
           width: MediaQuery.of(context).size.width*0.5,
           height: MediaQuery.of(context).size.height*0.3,
           ),
           ActionButton(
            width: MediaQuery.of(context).size.width*0.4,
             bordersidecolor: Colors.white,
                color:Colors.blue.shade900,
             ontap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> LoginScreen()));
             },
              text: "As a Customer"
             ),
             Text("OR"),
             ActionButton(
                bordersidecolor: Colors.blue.shade900,
                color:Colors.white,
                textColor: Colors.blue.shade900,
               width: MediaQuery.of(context).size.width*0.4,
               ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>WorkerFirstScreen()));
               }, 
               text: "As a Worker"),
        ],
      ),
    );
  }
}
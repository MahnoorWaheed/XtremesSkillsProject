import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/auth/screen/login.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/widgets/action_button.dart';
import 'package:xtremes_skills/widgets/clip.dart';


class WorkerFirstScreen extends StatelessWidget {
  const WorkerFirstScreen({ Key? key }) : super(key: key);

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
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Login()));
             },
              text: "Login"
             ),
             Text("OR"),
             ActionButton(
                bordersidecolor: Colors.blue.shade900,
                color:Colors.white,
                textColor: Colors.blue.shade900,
               width: MediaQuery.of(context).size.width*0.4,
               ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>signup()));
               }, 
               text: "Sign Up"),
        ],
      ),
    );
  }
}
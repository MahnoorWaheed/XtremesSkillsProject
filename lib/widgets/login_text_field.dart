import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
 

   MyTextField({
    Key? key,
    required this.label,
    required this.icons,
    this.height,
    this.width,
     this.controller,
     this.onSaved,
     
  }) : super(key: key);

final String label;
final Icon icons;

 final double? height;
 final double? width;
 final  TextEditingController? controller;
final FormFieldSetter<String>? onSaved;





  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(

        width: width,
         height: height,
        margin: EdgeInsets.only(top: 20),
        child: TextFormField(
          // controller: firstname,
                          controller: controller,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon: icons,
                              labelText: label,
                              labelStyle: TextStyle(color: Colors.blue[800]),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          validator: (input){
                            if(controller!.text.isEmpty || controller!.text== null){
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          onSaved: onSaved,
                        ),
        ),
    );
  }
}

    // decoration: InputDecoration(
    // // labelText: label,
    // prefixIcon: icons,
    // hintText: label,
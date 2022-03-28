import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtremes_skills/model/user.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';
import 'package:xtremes_skills/widgets/formwidget/form.dart';


class MultiForm extends StatefulWidget {
  const MultiForm({Key? key}) : super(key: key);

  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<User> users = [];
  List<UserForm> forms = [];
    List<UserForm> formsdata = [];

      final form = GlobalKey<FormState>();
 bool valuefirst = false;  
  bool valuesecond = false; 
    String codeDialog = '';
  String valueText = ''; 

  @override
  Widget build(BuildContext context) {
    // forms.clear();
    // for (int i = 0; i < users.length; i++) {
    //   forms.add(UserForm(
    //     user: users[i],
    //     onDelete: () => onDelete(i),
    //     key: GlobalKey(), onSave:  users[i] ,
    //   ));
   
    // }
     
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          child: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  leading: Icon(Icons.people),
                  title: Text('Service Details'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: (){},
                      //widget.onDelete,
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     children: [                 
                    CheckboxListTile(  
                    secondary: const Icon(Icons.design_services),  
                    title: const Text('AC Jet Service'),  
                    subtitle: Text('Our engineer will visit your home to service your air conditioner.'),  
                    value: this.valuefirst,
                    onChanged: (value){
                      setState(() {  
                        this.valuefirst = value!;  
                      }); 
                     openDialog();
                     }),
                     SizedBox(height: 20,),
                    CheckboxListTile(  
                    controlAffinity: ListTileControlAffinity.trailing,  
                    secondary: const Icon(Icons.alarm),  
                    title: const Text('AC Repair'),  
                    subtitle: Text('Our AC service engineer will inspect, diagnose the issue and undertake AC repair'),  
                    value: this.valuesecond,  
                    onChanged: (value) {  
                      setState(() {  
                        this.valuesecond = value!;  
                      });
                      }), 
                      SizedBox(height: 20,),
                        CheckboxListTile(  
                    controlAffinity: ListTileControlAffinity.trailing,  
                    secondary: const Icon(Icons.alarm),  
                    title: const Text('AC Gas Refilling'),  
                    subtitle: Text('Our engineer will first diagnose your AC for gas leakage and then undertake repair. '),  
                    value: this.valuesecond,  
                    onChanged: (value) {  
                      setState(() {  
                        this.valuesecond = value!;  
                      });
                      }), 
                      SizedBox(height: 20,), 
                      CheckboxListTile(  
                    controlAffinity: ListTileControlAffinity.trailing,  
                    secondary: const Icon(Icons.alarm),  
                    title: const Text('AC Installation'),  
                    subtitle: Text('Our engineer will install the air conditioner. Any spare parts required will be charged separately '),  
                    value: this.valuesecond,  
                    onChanged: (value) {  
                      setState(() {  
                        this.valuesecond = value!;  
                      });
                      }),
                    ]
                  )
                  // TextFormField(
                  //   initialValue: widget.user.service,
                  //   onSaved: (val) => widget.user.service = val!,
                  //   validator: (val) =>
                  //       val!.length > 7 ? null : 'Service feild is invalaid',
                  //   cursorColor: Colors.black,
                  //   decoration: InputDecoration(
                  //     labelText: 'Service',
                  //     // hintText: 'Enter your Service',
                  //     icon: Icon(
                  //       Icons.miscellaneous_services,
                  //       color: Colors.lightBlue,
                  //     ),
                  //     isDense: true,
                  //   ),
                  // ),
                ),
               
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }

Future openDialog(){
  return  showDialog(
       context: context,
       builder: (context) {
         return  AlertDialog(
      title: Text(
        'Enter Service Details',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        //Theme.of(context).textTheme.title.color,
        fontWeight: FontWeight.w800,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      actions: <Widget>[
       TextButton(onPressed: (){}, child: Text("Cancle")),
       TextButton(onPressed: (){}, child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              // focusNode: _nodePhone,
              // maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeEmail);
              },
            ),
            TextField(
              // focusNode: _nodeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeFullname);
              },
            ),
           
            
          ],
        ),
      ),
    );
       });
}

}
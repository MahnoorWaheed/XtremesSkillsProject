import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/dashboard.dart';
import 'package:xtremes_skills/widgets/action_button.dart';


class Skill_Details extends StatefulWidget {
  final String SkillName;
  final String Service1;
  final String Service2;
  final String Service3;
  final String Service4;
  final String details1;
  final String details2;
  final String details3;
  final String details4;

  // String prc;
  // int ct = 1;

 Skill_Details(this.SkillName,this.Service1, this.Service2, this.Service3, this.Service4, this.details1, this.details2, this.details3, this.details4, 
 //this.Service2, this.Service3, this.Service4,
 );

  @override
  State<Skill_Details> createState() => _Skill_DetailsState();
}

class _Skill_DetailsState extends State<Skill_Details> {
   final form = GlobalKey<FormState>();
 bool valuefirst = false;  
  bool valuesecond = false; 
    bool valuethird = false; 
     bool valuefourth = false; 
    String codeDialog = '';
  String valueText = ''; 
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  String txtdata = '';
  String txtdata2 = '';
   String txtdata3 = '';
  String service = '';

 String userName = '';
  String userEmail = '';
  bool isLoading = true;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

   getUserData() async {
    await FirebaseFirestore.instance
        .collection('worker')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((value) {
      print(value.docs.first.data()['firstname']);
      print(value.docs.first.data()['lastname']);
      print(value.docs.first.data()['email']);
      userName = value.docs.first.data()['firstname'];
      userEmail = value.docs.first.data()['email'];
    });
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("Skill name 2"+ widget.SkillName,);
    return Scaffold(
      appBar: AppBar(
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
      body:  Padding(
      padding: EdgeInsets.all(8),
      child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                   children: [                 
                  CheckboxListTile(  
                  secondary: const Icon(Icons.alarm),  
                  title: Text(widget.Service1),  
                  subtitle: Text(widget.details1),  
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
                  title: Text(widget.Service2),  
                  subtitle: Text(widget.details2),  
                  value: this.valuesecond,  
                  onChanged: (value) {  
                    setState(() {  
                      this.valuesecond = value!;  
                    });
                     openDialog();
                    }), 
                    SizedBox(height: 20,),
                      CheckboxListTile(  
                  controlAffinity: ListTileControlAffinity.trailing,  
                  secondary: const Icon(Icons.alarm),  
                  title:  Text(widget.Service3),  
                  subtitle: Text(widget.details3),  
                  value: this.valuethird,  
                  onChanged: (value) {  
                    setState(() {  
                      this.valuethird = value!;  
                    });
                    // openDialog();
                    }), 
                    SizedBox(height: 20,), 
                    CheckboxListTile(  
                  controlAffinity: ListTileControlAffinity.trailing,  
                  secondary: const Icon(Icons.alarm),  
                  title: Text(widget.Service4),  
                  subtitle: Text(widget.details4),  
                  value: this.valuefourth,  
                  onChanged: (value) {  
                    setState(() {  
                      this.valuefourth = value!;  
                    });
                     openDialog();
                    }),

                  CheckboxListTile(  
                  controlAffinity: ListTileControlAffinity.trailing,  
                  secondary: const Icon(Icons.alarm),  
                  title: Text("Other"),  
                  subtitle: Text("Enter your own service"),  
                  value: this.valuefourth,  
                  onChanged: (value) {  
                    setState(() {  
                      this.valuefourth = value!;  
                    });
                    openDialog2();
                    }),

                    // ActionButton(ontap: (){
                    //     openDialog();

                    // }, text: "Continue")
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
      
    )
      
    );
  }
  Future openDialog(){
  return showDialog(
       context: context,
       barrierDismissible: false,
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
       TextButton(onPressed: (){
         Navigator.of(context).pop();
       }, child: Text("Cancle")),
       TextButton(onPressed: (){
         var data = widget.SkillName;
         print("worker emial" + userEmail);

                                      _firestore.collection('worker').doc(userEmail).collection("worker_skills").doc(data).set({
                                    'SkillName': widget.SkillName,
                                    'Service1': widget.Service1,
                                    'Description' : txtdata,
                                    'Price' : txtdata2,
                                      });
                                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Dashboard()));
                                    //   collection('users')
                                    //   .doc('DsRo2PUO3IZbNvWumXP5u4USv512')
                                    //   .collection('skills')
                                    //   .doc(widget.SkillName)
                                    //   .set({
                                    // 'SkillName': widget.SkillName,
                                    // 'Service1': widget.Service1,
                                    // 'Description' : txtdata,
                                    // 'Price' : txtdata2,
                                    // // 'Password': password,
                                    // // //'Confirm Password': cpassword,
                                    // // 'PhoneNumber': phone,
                                    // });

print("skill name : ${widget.SkillName}");
print("service name : ${widget.Service1}");
print("service description : ${txtdata}");
print("service price : ${txtdata2}");

         
       }, child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              // controller: txt1,
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
            onChanged: (value){
              //  setState(() {
                   txtdata = value;
              //  });
             
            },
            ),
            TextFormField(
              // focusNode: _nodeEmail,
              // controller: txt2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeFullname);
              },
              onChanged: (value){
                // setState(() {
                  txtdata2 = value;
                // });
                
              },
            ),
           
            
          ],
        ),
      ),
    );
       });
}
Future openDialog2(){
  return showDialog(
       context: context,
       barrierDismissible: false,
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
       TextButton(onPressed: (){
         Navigator.of(context).pop();
       }, child: Text("Cancle")),
       TextButton(onPressed: (){
         var data = widget.SkillName;

                                      _firestore.collection('users').doc('9FKaPM5vDxXvGZikvVsIcWT5C472').collection("skills").doc().set({
                                    'SkillName': widget.SkillName,
                                    'service': txtdata3,
                                    'Description' : txtdata,
                                    'Price' : txtdata2,
                                      });
                                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Dashboard()));
                                    //   collection('users')
                                    //   .doc('DsRo2PUO3IZbNvWumXP5u4USv512')
                                    //   .collection('skills')
                                    //   .doc(widget.SkillName)
                                    //   .set({
                                    // 'SkillName': widget.SkillName,
                                    // 'Service1': widget.Service1,
                                    // 'Description' : txtdata,
                                    // 'Price' : txtdata2,
                                    // // 'Password': password,
                                    // // //'Confirm Password': cpassword,
                                    // // 'PhoneNumber': phone,
                                    // });

print("skill name : ${widget.SkillName}");
print("service name : ${widget.Service1}");
print("service description : ${txtdata}");
print("service price : ${txtdata2}");

         
       }, child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              // controller: txt1,
              // focusNode: _nodePhone,
              // maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Service Name',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeEmail);
              },
            onChanged: (value){
              //  setState(() {
                   txtdata3 = value;
              //  });
             
            },
            ),
            TextFormField(
              // controller: txt1,
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
            onChanged: (value){
              //  setState(() {
                   txtdata = value;
              //  });
             
            },
            ),
            TextFormField(
              // focusNode: _nodeEmail,
              // controller: txt2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // FocusScope.of(context).requestFocus(_nodeFullname);
              },
              onChanged: (value){
                // setState(() {
                  txtdata2 = value;
                // });
                
              },
            ),
           
            
          ],
        ),
      ),
    );
       });
}
}
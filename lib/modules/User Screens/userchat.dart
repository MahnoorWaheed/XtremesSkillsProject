import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';


class UserChat extends StatefulWidget {
  final String chatid;

  final String current_name;
  const UserChat({required this.chatid,required this.current_name, Key? key }) : super(key: key);

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
   var loadimage = false;
    File? _image;
     final pickedFile = ImagePicker();
     String? downloadURL;
  
  List<String> users=['name'];
  final TextEditingController _message= TextEditingController();

  
  
  void onSendMessage({required String message}) async{
    log('Call');
    if(message.isNotEmpty){
      log('innercall');
    //   Map<String,dynamic> message ={
    //   "sendby": widget.current_name,
    //   "message": _message,
    //   "time": FieldValue.serverTimestamp(),
    // };
    log(widget.chatid);
    log(widget.current_name);
    await FirebaseFirestore.instance.collection('newchat').doc(widget.chatid).collection('chats').add({
        
      "message": message, 
       "sendby": widget.current_name,
      "time": FieldValue.serverTimestamp(),
      "type": "text"
    });
    _message.clear();

    }
    else{
      log("enter text");
    }
  }
    Future chooseimage() async {
      log('call');
    final pick = await pickedFile.pickImage(source: ImageSource.gallery);
    if (pick != null) {
      _image = File(pick.path);
      uploadImage();
    }
    loadimage = true;
  }

/*  upload image to the firebase storage  and get the url and
    add the url to firestore database
    
*/
  Future uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.chatid}/chats")
        .child("post_$postID");
    await ref.putFile(_image!);
    log('its ok');
    downloadURL = await ref.getDownloadURL(); 
    if (downloadURL!.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": downloadURL,
        "sendby": widget.current_name,
        "time": FieldValue.serverTimestamp(),
        "type": "image"

        // "downloadURL": downloadURL,
      };
    FirebaseFirestore.instance.collection('newchat').doc(widget.chatid).collection('chats').add(messageMap);

      downloadURL = "";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        title:  const Center(
          child: Text(
            'chat',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: "Times New Roman"),
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const <Widget>[
          
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
              
                 height: MediaQuery.of(context).size.height *0.835,
                 width: MediaQuery.of(context).size.width,
                 child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('newchat').doc(widget.chatid).collection('chats').orderBy("time",descending: false).snapshots(),
                   builder: (context, snapshot) {
                     if(!snapshot.hasData){
                       return const Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     return ListView.builder(
                       itemCount:  snapshot.data!.docs.length,
                       itemBuilder: (ctx,index){
                         DocumentSnapshot chats=snapshot.data!.docs[index];
                       return MessageTile(
                         chats['message'],
                         chats['sendby']== widget.current_name,
                         chats['type'],
                       );
                        // Padding(
                        //  padding: const EdgeInsets.all(8.0),
                        //  child: Container(
                        //    child: 
                        //    Column(
                        //      children: [
                        //        Text(chats['message'],)
                        //      ],
                        //    ),
                        //  ));
      
                     });
                     
                   }) ,
              
              ),
              Container(
          // margin: const EdgeInsets.only(top: 670),
          color: Colors.white,
          child: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.photo),
                iconSize: 25,
                color: Colors.blue.shade900,
                onPressed: () {
                  chooseimage();
                }),
            Expanded(
              child: TextField(
                controller: _message,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message...',
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            IconButton(
                icon: const Icon(Icons.send),
                iconSize: 25,
                color: Colors.blue.shade900,
                onPressed: () {
                  onSendMessage(message: _message.text);
                  // _firestore.collection('Messages').doc().set(
                  //   {
                  //     "Customer message": _controller.text,
                  //   },
                  // ).whenComplete(() => _controller.clear());
                }),
          ],
          ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  String type;
  

  MessageTile(this.message, this.isSendByMe,this.type);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         type == "image"
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.only(
                    left: isSendByMe ? 0 : 24, right: isSendByMe ? 24 : 0),
                alignment:
                    isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                     Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_)=> ShowImage(imageurl: message))
                                            );
                  },
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(message),
                      ),
                    ),
                  ),
                )):
       Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.only(
                            left: isSendByMe ? 0 : 24,
                            right: isSendByMe ? 24 : 0),
                        alignment: isSendByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          // margin: EdgeInsets.symmetric( horizontal: 10,   ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: isSendByMe
                                      ? [
                                          const Color(0xFF81D4FA),
                                          const Color(0xFF4FC3F7),
                                        ]
                                      : [
                                          const Color(0xFFFBE9E7),
                                          const Color(0xFFFFCCBC),
                                        ]),
                              borderRadius: isSendByMe
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                      bottomLeft: Radius.circular(24))
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                      bottomRight: Radius.circular(24))),
                          child: Text(
                            message,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
      ],
    );
  }
}
class ShowImage extends StatelessWidget {
  final String imageurl;
  const ShowImage({required this.imageurl, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Image.network(imageurl),
        ),
      ),
    );
  }
}
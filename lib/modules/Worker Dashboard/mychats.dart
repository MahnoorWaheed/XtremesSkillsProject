import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  // final _firestore = FirebaseFirestore.instance;
  // GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  // initState() {
  //   Navigator.pop(context);
  //   super.initState();
  // }

  _sendMessageArea() {
    return Container(
      margin: EdgeInsets.only(top: 670),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25,
              color: Colors.blue.shade900,
              onPressed: () {}),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 25,
              color: Colors.blue.shade900,
              onPressed: () {
                // _firestore.collection('Messages').doc().set(
                //   {
                //     "Customer message": _controller.text,
                //   },
                // ).whenComplete(() => _controller.clear());
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text(
            "Contact your rider  ",
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _sendMessageArea(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xtremes_skills/model/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({required Key key, required this.user, required this.onDelete})
      : super(key: key);

  @override
  _UserFormState createState() => state;
  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    onPressed: widget.onDelete,
                    icon: Icon(Icons.delete),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.user.service,
                  onSaved: (val) => widget.user.service = val!,
                  validator: (val) =>
                      val!.length > 7 ? null : 'Service feild is invalaid',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Service',
                    // hintText: 'Enter your Service',
                    icon: Icon(
                      Icons.miscellaneous_services,
                      color: Colors.lightBlue,
                    ),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.user.description,
                  onSaved: (val) => widget.user.description = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Description feild is invalaid',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    // hintText: 'Enter your Service',
                    icon: Icon(
                      Icons.description,
                      color: Colors.lightBlue,
                    ),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.user.price.toString(),
                  onSaved: (val) => widget.user.price = val! as int,
                  validator: (val) =>
                      val!.length > 7 ? null : 'Price feild is invalaid',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    // hintText: 'Enter your Service',
                    icon: Icon(
                      Icons.price_change,
                      color: Colors.lightBlue,
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ],
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
}

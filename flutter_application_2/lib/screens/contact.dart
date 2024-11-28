import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  MyData _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formStateKey,
              child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(children: <Widget>[
                    Text("We Want To Hear From You",
                        style: TextStyle(fontSize: 45, height: 1)),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid name.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _data.name = value!;
                        }),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _data.email = value!;
                        }),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Message',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _data.message = value!;
                        }),
                    TextButton(
                        child: const Text('Send'),
                        onPressed: () {
                          if (_formStateKey.currentState!.validate()) {
                            _formStateKey.currentState?.save();
                          } else {}
                        })
                  ])))),
    ));
  }
}

class MyData {
  late String name;
  late String email;
  late String message;
}

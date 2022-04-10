import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

// void main() => runApp(const Register());

class realtimeDatabaseInsert extends StatefulWidget {
  realtimeDatabaseInsert({Key? key}) : super(key: key);

  @override
  realtimeDatabaseInsertState createState() => realtimeDatabaseInsertState();
}

class realtimeDatabaseInsertState extends State<realtimeDatabaseInsert> {
  var usernameController = new TextEditingController();
  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(
          "Insert Data",
          style: TextStyle(fontSize: 28),
        ),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              labelText: "userame", border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: fnameController,
          decoration:
              InputDecoration(labelText: "fname", border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: lnameController,
          decoration:
              InputDecoration(labelText: "lname", border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: emailController,
          decoration:
              InputDecoration(labelText: "email", border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              labelText: "password", border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 30,
        ),
        OutlinedButton(
            onPressed: () {
              if (usernameController.text.isNotEmpty &&
                  fnameController.text.isNotEmpty &&
                  lnameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                insertData(
                    usernameController.text,
                    fnameController.text,
                    lnameController.text,
                    emailController.text,
                    passwordController.text);
              }
            },
            child: Text(
              "Add",
              style: TextStyle(fontSize: 20),
            ))
      ]),
    )));
  }

  void insertData(String username, String fname, String lname, String email,
      String password) {
    //String key = databaseRef.child("Users").child("ListRgister").push().key;
    databaseRef.child("Users").child("ListRgister").push().set({
      //'id': key,
      'Username': username,
      'Firstname': fname,
      'Lastname': lname,
      'Email': email,
      'Password': password,
    });
    usernameController.clear();
    fnameController.clear();
    lnameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
  
    //return MaterialApp(
    
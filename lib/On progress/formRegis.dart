import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'signup_alert.dart';
import 'package:Sensoria/model/user.dart';

class FormRe extends StatefulWidget {
  const FormRe({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormRe> {
  final formKey = GlobalKey<FormState>();
  User myUser = User(
      username: '',
      fname: '',
      lname: '',
      email: '',
      password: '',
      password2: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _userCollection = FirebaseFirestore.instance.collection("user");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot)
    {
      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Text("${snapshot.error}"),
          ),
        );
      }

      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please fulfill this feild"),
                              onSaved: (String username) {
                                myUser.username = String(username);
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Firstname",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please fulfill this feild"),
                              onSaved: (String? fname) {
                                myUser.fname = fname;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lastname",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please fulfill this feild"),
                              onSaved: (String lname) {
                                myUser.lname = lname;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: MultiValidator([
                                EmailValidator(errorText: "Wrong Format"),
                                RequiredValidator(
                                    errorText: "Please fulfill this feild"),
                              ]),
                              onSaved: (String email) {
                                myUser.email = email;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please fulfill this feild"),
                              onSaved: (String password) {
                                myUser.password = password;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Confirm Password",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Please fulfill this feild"),

                              onSaved: (String password2) {
                                //if("password2" == "password"){
                                myUser.password2 = password2;
                              },
                              //},
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                child: Text(
                                  "CREATE MY ACCOUNT",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    await _userCollection.add({
                                      "username": myUser.username,
                                      "fname": myUser.fname,
                                      "lname": myUser.lname,
                                      "email": myUser.email,
                                      "password": myUser.password,
                                      "confirm password": myUser.password2
                                    });
                                    formKey.currentState.reset();
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                    )
                )
            )
        );

      }
      );

  }
}

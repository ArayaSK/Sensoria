import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import '../home.dart';
import '../model/userModel.dart';
import 'package:sensoria/alert/logout_alert.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {

    final logoutButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AboutWidget2();
                  },
          ),
          child: Text(
            "LOG OUT",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 90,
                child: Image.asset("assets/images/user.png", fit: BoxFit.contain),
              ),
               SizedBox(
                height: 10,
              ),
              Text(
                "${loggedInUser.userName}",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("First Name: ${loggedInUser.firstName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  )),
              Text("Last Name: ${loggedInUser.lastName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  )),
              Text("Email: ${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 15,
              ),

              logoutButton,
              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}

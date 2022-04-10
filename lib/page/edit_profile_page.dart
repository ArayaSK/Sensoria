import 'dart:io';

//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../services/auth.dart';

import 'package:Sensoria/model/oldUser.dart';
import 'package:Sensoria/utils/user_preferences.dart';
import 'package:Sensoria/widget/appbar_widget.dart';
import 'package:Sensoria/widget/profile_widget.dart';
import 'package:Sensoria/widget/textfield_widget.dart';
import 'package:Sensoria/page/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User2 user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: buildAppBar(context),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),

              TextFieldWidget(
                label: 'Firstname',
                text: user.fname,
                onChanged: (fname) {},
              ),
              const SizedBox(height: 24),

              TextFieldWidget(
                label: 'Lastname',
                text: user.lname,
                onChanged: (lname) {},
              ),
              const SizedBox(height: 24),

              TextFieldWidget(
                label: 'Email',
                text: user.email,
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),

              TextFieldWidget(
                label: 'Password',
                text: user.password,
                onChanged: (password) {},
              ),
              const SizedBox(height: 24),

              // still have no idea to do it!
              TextFieldWidget(
                label: 'Confirm Password',
                text: user.password,
                onChanged: (password) {},
              ),
              const SizedBox(height: 24),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(30),
                      child: FlatButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        //color: Colors.black,
                        textColor: Colors.white,

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        },
                      ),
                    )),
                  ])
            ],
          ),
        ),
      );
}

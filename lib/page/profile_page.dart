//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Sensoria/model/oldUser.dart';
// import 'package:Sensoria/page/edit_profile_page.dart';
import 'package:Sensoria/utils/user_preferences.dart';
import 'package:Sensoria/widget/appbar_widget.dart';
import 'package:Sensoria/widget/profile_widget.dart';
import 'package:Sensoria/logout_alert.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              // profile image
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => EditProfilePage()),
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            //const SizedBox(height: 24),
            buildAbout(user),
            const SizedBox(height: 48),

            // button => logout
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
                              'LogOut',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            //color: Colors.black,
                            textColor: Colors.white,

                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AboutWidget2();
                              },
                            ),
                          ))),

                  // button => edit
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1),
                          ),
                          margin: EdgeInsets.all(30),
                          child: FlatButton(
                            child: Text(
                              'Edit',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            //color: Colors.black,
                            textColor: Colors.black,

                            onPressed: () {
                              Navigator.push(
                                context,
                                //MaterialPageRoute(builder: (context) => EditProfilePage()),
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                          )))
                ])
          ],
        ),
      ),
    );
  }

  Widget buildName(User2 user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          //Text(
          // user.email,
          //  style: TextStyle(color: Colors.grey),
          //)
        ],
      );

  Widget buildAbout(User2 user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  'Fristname: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  user.fname,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24),
              ],
            ),
            //Spacer(),

            Row(
              children: [
                Text(
                  'Lastname: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  user.lname,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  'Email:         ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24),
              ],
            ),

            Row(
              children: [
                Text(
                  'Password: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  user.password,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      );
}

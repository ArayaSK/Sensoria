import "package:flutter/material.dart";
//import 'package:sensoria/page/profile_page.dart';
import 'package:sensoria/screen/logout_screen.dart';
import 'package:sensoria/screen/profile_screen.dart';

//import '../main.dart';

void main() => runApp(AboutWidget2());

class AboutWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Are you sure you want to log out?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      actions: <Widget>[
        Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          //margin: EdgeInsets.all(30),
          child: FlatButton(
            child: new Text(
              'Log out',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogOut()),
              );
            },
          ),
        ),
        FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

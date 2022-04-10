import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(AboutWidget());

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Welcome to Sensoria!',
                      style: TextStyle(
                        color: Colors.white,),
                      ),
              ),
      backgroundColor: Colors.black,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Expanded(
            child: Text('Create an account successfully, log in to get new experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          //margin: EdgeInsets.all(30),
          child: FlatButton(
            child: new Text('Login', style: TextStyle(color: Colors.black,),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            ),
          ),

        FlatButton(

          child: Text('Later', style: TextStyle(color: Colors.white,),),
            onPressed: () {
              Navigator.of(context).pop();
            },
        ),
      ],
    );
  }
}
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class startPage extends StatelessWidget {
  const startPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            //container
            height: 500,
            width: 500,
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/Logo.png'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 100.0,
                color: Colors.grey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(30),
                              child: TextButton(
                                child: Text(
                                  'LogIn',
                                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginScreen()),
                                  );
                                },
                              )
                          )
                      ),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(30),
                              child: TextButton(
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      //builder: (context) => const Register()),
                                        builder: (context) =>
                                        const RegistrationScreen()),
                                  );
                                },
                              )
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}

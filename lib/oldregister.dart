import 'package:flutter/material.dart';

import 'signup_alert.dart';

void main() => runApp(const OldRegister());

class OldRegister extends StatelessWidget {
  const OldRegister({Key? key}) : super(key: key);

  @optionalTypeArgs
  static Future<T?> push<T extends Object?>(
      BuildContext context, Route<T> route) {
    return Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          //theme: ThemeData(
          backgroundColor: Colors.white,
          //),
          title: Text(
            'CREATE A NEW ACCOUNT',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'CREATE A NEW ACCOUNT',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
           */
            new Container(
              padding: const EdgeInsets.all(10),
              child: new TextField(
                //controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address*',
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(10),
              child: new TextField(
                //controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First name*',
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(10),
              child: new TextField(
                //controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'last name*',
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password*',
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextField(
                obscureText: true,
                //controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password*',
                ),
              ),
            ),
            new Container(
              height: 70,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                child: const Text('CREATE MY ACCOUNT'),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AboutWidget();
                  },
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}

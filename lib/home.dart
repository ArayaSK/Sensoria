import 'package:flutter/material.dart';

import 'profile.dart';
import 'camera.dart';
import 'history.dart';

void main() => runApp(const home());

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

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
          backgroundColor: Colors.white,
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
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Container(
                height: 220.0,
                width: 220.0,
                child: new Image.asset('assets/images/Logo2.png'),
              ),
            ),
            new Container(
              height: 100,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                child: Text(
                  'CAMERA',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => camera()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
            new Container(
              height: 95,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: ElevatedButton(
                child: Text(
                  'PROFILE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
            new Container(
              height: 90,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: ElevatedButton(
                child: Text(
                  'HISTORY',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => history()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
            new Container(
              height: 90,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: ElevatedButton(
                child: Text(
                  'FAVORITE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const home()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

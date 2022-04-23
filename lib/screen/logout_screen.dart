//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

//import 'profile_screen.dart';
import 'package:sensoria/main.dart';
//import 'history.dart';

void main() => runApp(const LogOut());

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

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
      ),
      /*
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context, false),
          )),

           */
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

  get cameras => null;

  @override
  Widget build(BuildContext context) {
    final OKButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
              context,
              //
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          child: Text(
            "OK",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 220.0,
                width: 220.0,
                child: Image.asset('assets/images/Logo2.png'),
              ),
            ),
            Text(
              "Good Bye!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            OKButton,
            SizedBox(height: 15),
          ],
        ),
      ),
      ),
    );
  }
}

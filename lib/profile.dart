import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:Sensoria/page/profile_page.dart';
import 'package:Sensoria/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Profile());
}

class Profile extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Builder(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ThemeProvider.of(context),
        //theme: ThemeProvider.themeOf(context),
        title: title,
        home: ProfilePage(),
      ),
    );
  }
}

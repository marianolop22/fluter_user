import 'package:flutter/material.dart';
import 'package:flutter_user/src/pages/home_page.dart';
import 'package:flutter_user/src/pages/settings_page.dart';
import 'package:flutter_user/src/shared_prefs/user_preferences.dart';
 
void main() async { 
  
  final prefs = new UserPreferences();
  await  prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.lastPage, //originalmente iba esto HomePage.routeName
      routes: { 
        HomePage.routeName: ( BuildContext context ) => HomePage(),
        SettingPage.routeName: ( BuildContext context ) => SettingPage()
      },
    );
  }
}
import 'dart:async';

import 'package:fleets_app/screens/intro_app/call_contact_accept.dart';
import 'package:fleets_app/screens/intro_app/first_step.dart';
import 'package:fleets_app/screens/intro_app/localisation.dart';
import 'package:fleets_app/screens/intro_app/once_upon_a_time.dart';
import 'package:fleets_app/screens/intro_app/whatisFleets.dart';
import 'package:fleets_app/screens/messages/messages.dart';
import 'package:fleets_app/screens/profil/profil.dart';
import 'package:flutter/material.dart';
import 'screens/intro_app/welcome.dart';
import 'screens/connexion/login.dart';
import 'screens/connexion/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
// void main() {
//   runApp(MyApp());
// }
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: {
      '/HomePage': (context) => new Login(),
      '/Register': (context) => new Register(),
      '/WelcomePage': (context) => new Welcome(),
      '/Profil': (context) => new Profil(),
      '/Messages': (context) => new Messages(),
      
      // Pages d accueil
      '/Fleets?': (context) => new WhatisFleets(),
      '/OnceUponAtime': (context) => new OnceUponaTime(),
      '/Localisation': (context) => new Localisation(),
      '/CallContactSMS': (context) => new CallContactSMS(),
      '/FirstStep': (context) => new FirstStep(),
    },
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    var _duration = new Duration(seconds: 3);

    if (firstTime != null && !firstTime) {// Not first time
      return new Timer(_duration, navigationPageHome);
    } else {// First time
      prefs.setBool('first_time', false);
      return new Timer(_duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/HomePage');     //If Not first time launch app
  }

  void navigationPageWel() {

    Navigator.of(context).pushReplacementNamed('/WelcomePage');   // if first time launch app
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("oe")),
    );
  }
}

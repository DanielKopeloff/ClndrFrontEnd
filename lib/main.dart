import 'package:clndr/settings.dart';
import 'package:clndr/signIn.dart';
import 'package:clndr/signUp.dart';
import 'package:flutter/material.dart';

import 'friends.dart';
import 'groups.dart';
import 'home.dart';
import 'login.dart';
import 'messenger.dart';

void main() {
  return runApp(CalendarApp());
}

/// Where the app is loaded and the routes are declared
/// @author Daniel Kopeloff
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calendar Demo' ,
    initialRoute: "/",
    routes: {
    '/'       : (context) => Login(),
    '/signIn' : (context) => SignIn() ,
    '/signUp' : (context) => SignUp() ,
    '/home'   : (context)=> MyHomePage(),
    '/friends': (context) => Friends(),
    '/groups' : (context) => Groups(),
    '/messaging' : (context) => Messenger(),
    '/setting' : (context) => Settings(),
    }
    );
  }
}

















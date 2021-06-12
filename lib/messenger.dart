import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Where Friends will be able to message each other
class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void changeState(int index){
      switch(index){

        case 0: {
          Navigator.pushNamed(context, '/home');
        }break;

        case 1 : {
          Navigator.pushNamed(context, '/friends');
        }break;

        case 2 : {
          Navigator.pushNamed(context, '/groups');
        }break;

        case 3 : {
          Navigator.pushNamed(context, '/setting');
        }break;

      }
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Messenger Page"),
      ),
      body: Center(
        child: Text("Welcome to the Messenger Page ") ,
      ), bottomNavigationBar: BottomNavigationBar(
      onTap: changeState,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_people),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Groups',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.amber[800],

    ),
    );

  }

}
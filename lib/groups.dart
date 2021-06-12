import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The groups page where you will be able to see your groups and maybe group calendars
class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Method used to change the page based on btn pressed
    void changeState(int index){
      switch(index){

        case 0 : {
          Navigator.pushNamed(context, '/home');
        }break;

        case 1 : {
          Navigator.pushNamed(context, '/friends');
        }break;

        case 2 : {
          Navigator.pushNamed(context, '/setting');
        }break;




      }
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Groups Page"),
      ),
      body: Center(
        child: Text("Welcome to the Groups Page ") ,
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
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.amber[800],

    ),
    );

  }

}
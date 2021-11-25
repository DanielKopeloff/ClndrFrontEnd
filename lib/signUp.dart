import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Sign Up page where the user will enter there info
/// TODO: find out how to have the user login with their google apple and other emails / accounts

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Method used to change the page based on btn pressed
    void changeState(int index){
      switch(index){
        case 0: {
          Navigator.pop(context);
        }break;
        case 1: {
          // instead of going straight to the home page we will have
          // some validation of the form somewhere
          Navigator.pushNamed(context, '/home');
        }

      }
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Sign Up Page"),
      ),
      body: Center(
        child: Text("Welcome to the Sign up Page\n "
            "who wants to make this form?  ") ,
      ), bottomNavigationBar: BottomNavigationBar(
      onTap: changeState,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.navigate_next),
          label: 'submit',
        )
      ],
      selectedItemColor: Colors.amber[800],

    ),
    );

  }

}
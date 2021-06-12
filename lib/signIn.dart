
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// sign in Page
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Will change the page based on the button that was pressed
    /// the index is the index of the array of items in the bottom navbar
    /// the 0 index is the back button and since we are just going back one page we can us the pop method
    void changeState(int index) {
      switch (index) {
        case 0 :
          {
            Navigator.pop(context);
          }
          break;

        case 1 :
          {
            Navigator.pushNamed(context, '/home');
          }
          break;
      }
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Sign in Page"),
      ),
      body: Center(
        child: Column(
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'UserName'
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            )

          ],
        ) ,
      ), bottomNavigationBar: BottomNavigationBar(
      onTap: changeState,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.login_outlined),
          label: 'Login',
        ),

      ],
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.amber[800],

    ),
    );

  }


}
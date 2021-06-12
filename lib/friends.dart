import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsBtn extends StatelessWidget {
  final description;


  const FriendsBtn({
    Key? key, this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0 , top: 100),
      child: ElevatedButton(
        child: Text(description),
        onPressed: () {
          Navigator.pushNamed(context, '/friends');
        },
      ),
    );
  }
}

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Method used to change the page based on btn pressed
    void changeState(int index){
      switch(index){
        case 0 : {
          Navigator.pushNamed(context, '/home');
        }break;
        case 1 : {
          Navigator.pushNamed(context, '/groups');
        }break;
        case 2 : {
          Navigator.pushNamed(context, 'setting');
        }
      }
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Friends Page"),
      ),
      body: Center(
        child: Text("Welcome to the Friends Page ") ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeState,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Home',
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

      ),
    );

  }

}
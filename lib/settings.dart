
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Setting page
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Settings Page"),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go to Homepage',
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
      body: Center(
        child: Text("Welcome to the settings Page ") ,
      )
    );

  }

}
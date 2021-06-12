import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





/// Login Page
class Login extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
          child: Column(
            children:  <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Sign in"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signIn');
                  },
                ),
              ),
              ElevatedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
              )
            ],
          )
      ),

    );

  }

}



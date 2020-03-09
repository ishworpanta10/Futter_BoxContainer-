import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _buildContainer() => Container(
          child: Center(
            child: Hero(
              tag: "demo",
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/realme.jpg")),
                ),
              ),
            ),
          ),
        );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildContainer(),
          RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

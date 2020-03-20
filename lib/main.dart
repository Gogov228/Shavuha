import 'package:flutter/material.dart';

import 'ChouseShavuha.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const SCREEN_KEY = "MainScreen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Center(
          child: Text('ШАВУХА'),
        ),
      ),
      body: Container(
        //color: Colors.deepOrange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: ClipOval(
                  child: Image.asset(
                    'assets/shavaCat.jpg',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Салам, шаурма пополам!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  "Начать!",
                  style: TextStyle(fontSize: 18),
                ),
                padding: EdgeInsets.only(left: 50, right: 50),
                color: Colors.pink[200],
                disabledColor: Colors.pink[200],
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChouseShavuha(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// This widget is the root of your application.

}

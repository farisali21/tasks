import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'MyHomePage.dart';



void main() {
  /// this we should use if we want to make sure that app didn't rotation

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.cyan[200],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Parisienne',
                  fontSize: 20.0,
                ),
              ),
        ),
      ),
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}


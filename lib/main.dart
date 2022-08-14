import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'components/screens/scores.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart'; //sizer plugin for responsive design
import 'components/screens/quizWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //horizontal bar displayed at the top
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                // Image.asset(
                // 'assets/images/logo.png',
                // scale: 12,
                // ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Aquatic Plant Study Guide',
                  style: TextStyle(color: Colors.blueGrey.shade700), //<-- SEE HERE
                )
              ]),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            height: 80.h,
            width: 80.w,

            child: ListView(//listview to allow for scrolling
                children: [
              Image.asset(
                ('assets/images/plantLogo.png'),
                fit: BoxFit
                    .cover, //sets the child's size to be as small as possible while still covering the entire box of the parent
              ),
              ElevatedButton(
                  child: const Text('Quiz Yourself'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent)),
                    primary: Colors.white,
                    onPrimary: Colors.blueGrey,
                    shadowColor: Colors.cyan,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                  onPressed: () async {
                    await Firebase.initializeApp();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctxt) => QuizApp()),
                    );
                  }),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  child: const Text('Profile'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueAccent)),
                    primary: Colors.white,
                    onPrimary: Colors.blueGrey,
                    shadowColor: Colors.cyan,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                  onPressed: () async {
                    await Firebase.initializeApp();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctxt) => ScoreSheet()),
                    );
                  }),
            ]),
          ),
        ),
      );
    });
  }
}

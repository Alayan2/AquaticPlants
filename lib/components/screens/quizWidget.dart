import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../titlesection.dart';
import '../randomimage.dart';
import '../functions.dart';
import '../lists.dart';
import '../buttons/answerbutton.dart';
import '../buttons/nextbutton.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';
import 'package:sizer/sizer.dart'; //sizer plugin for responsive design

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuizWidget();
  }
}

class QuizWidget extends State<QuizApp> {

  Future<void> adsfa()  async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final database = FirebaseDatabase.instance.ref();

  bool freshRun = true;
  List<int> numberList = [];
  var buttonList = [];

  Random _rndImg = Random();
  Color _buttonColor = Colors.white;

  void _buttonColorCheck(int r) {
    final grade = database.child('userStats/');

    setState(() {
      if (plantNames[r].toString() == plantNames[plantImgIndex].toString()) {
        _buttonColor = Colors.greenAccent;
        freshRun = false;
        grade.set({
          'passingCount': ServerValue.increment(1),
          'totalCount': ServerValue.increment(1)});
      } else {
        _buttonColor = Colors.red.shade400;
        grade.set({
          'plantName': plantNames[plantImgIndex].toString(),
          'totalCount': ServerValue.increment(1)});
        //add category to plant name to develop study guide for user
        //ie: you
      }
    });
  }

  void _nextButton() {
    setState(() {
      _rndImg = Random();
      _buttonColor = Colors.white;
      freshRun = true;
    });
  }

  Widget buildButtons(int i) {
    if (freshRun == true) {
      randomNumbers();
      numberList = [plantImgIndex, rndNameIndex, rndNameIndex2];
    }

    if (freshRun == true) {
      numberList.shuffle();
    }

    freshRun = false;

    buttonList = [
      AnswerButton(
          _buttonColorCheck,
          plantMap[numberList[i]]['name'].toString(),
          buttonVariable(numberList[i]),
          numberList[i])
    ];

    return Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buttonList[0],
              const Padding(padding: EdgeInsets.only(top: 5)),
            ]));
  }

  Color buttonVariable(int r) {
    if (r == plantImgIndex) {
      return _buttonColor;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        //creates an instance of the WidgetsApp
          home: Scaffold(
            //implements basic MD layout structure
            appBar: AppBar(
              //horizontal bar displayed at the top
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SizedBox(
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
              child: SizedBox(
                width: 90.w,
                height: 80.h,
                child: Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                  SizedBox(
                    height: 30.h,
                    width: 80.w,
                    child: buildImage(context, _rndImg, freshRun)
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 80.w,
                    child: ListView(
                      //listview to allow for scrolling
                      children: [
                        titleSection,
                        buildButtons(0),
                        buildButtons(1),
                        buildButtons(2),
                        // const Padding(padding: EdgeInsets.only(top: 5)),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 75, right: 75, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[NextButton(_nextButton)],
                            ))
                      ],
                    ),
                )],
              ),
              )
            )
          ));
    });
  }
}

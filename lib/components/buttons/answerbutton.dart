import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final Function(int) colorCheck;
  final String plantName;
  final Color button;
  final int indexNumber;

  AnswerButton(this.colorCheck, this.plantName, this.button, this.indexNumber);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => colorCheck(indexNumber),
        child: Text(plantName),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.blueAccent)),
          primary: button,
          onPrimary: Colors.blueGrey,
          shadowColor: Colors.cyan,
          elevation: 5,
        ));
  }
}
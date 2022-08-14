import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  final Function() next;

  const NextButton(this.next);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => next(),
        child: const Text('Next Question'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          shadowColor: Colors.cyan,
          elevation: 5,
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
        ));
  }
}
//Title below image
import 'package:flutter/material.dart';

Widget titleSection = Container(
  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 80, right: 80),
  child: Row(
    children: [
      Expanded(
        //fills container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade700 //<-- SEE HERE
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

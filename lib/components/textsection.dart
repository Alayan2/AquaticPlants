//Text section below image title
import 'package:flutter/material.dart';

Widget textSection = const Padding(
  padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
  child: Text(
    'Test your knowledge of Florida\'s aquatic plants with this quiz sourced from the Florida Department of Environmental Protection\'s plant identification resources. ',
    softWrap: true, //text lines will fill the column width
    textAlign: TextAlign.center,
  ),
);
import 'randomimage.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/lists.dart';

late Random rndImg; //late modifier allows use of non-nullable type for later assignment of value
late Random rndNum1; //late modifier allows use of non-nullable type for later assignment of value
late Random rndNum2; //late modifier allows use of non-nullable type for later assignment of value

int plantImgIndex = 0;
int plantNameIndex = 0;
int rndNameIndex = 0;
int rndNameIndex2 = 0;
String image_name ='';
int r = 0;

var randomOrderButtonWidgets = [];
void randomNumbers() {

    rndNum1 = new Random();

    while (rndNameIndex == plantImgIndex) {
      rndNameIndex = rndNum1.nextInt(plantImages.length - 1);
    }

    while (rndNameIndex2 == plantImgIndex || rndNameIndex2 == rndNameIndex) {
      rndNameIndex2 = rndNum1.nextInt(plantImages.length - 1);
    }

}
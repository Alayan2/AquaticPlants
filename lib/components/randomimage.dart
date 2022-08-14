import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/lists.dart';
import 'functions.dart';

//returns image asset of random plant image
Widget buildImage(BuildContext context, Random rndImg, bool a) {

  if(a) {

    int max = plantMap.length - 1;
    int r = rndImg.nextInt(max);
    plantImgIndex = r;
    image_name = plantMap[plantImgIndex]['image'].toString();

  }

  return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),

        child:Image.asset(
          image_name,
          height: 350,
          fit: BoxFit
              .cover, //sets the child's size to be as small as possible while still covering the entire box of the parent
        ));
}






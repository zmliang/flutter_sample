import 'dart:ui';
import 'package:flutter/material.dart';

Widget blurFilter(){
  return new BackdropFilter(
      filter : new ImageFilter.blur(sigmaX:10,sigmaY:10),
    child: new Container(
      decoration: new BoxDecoration(color: Colors.black87.withOpacity(0.1)),
    ),
  );
}
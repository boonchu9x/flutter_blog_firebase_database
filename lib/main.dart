import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red[400],
      //phù hợp mật độ điểm ảnh trên desktop app
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}



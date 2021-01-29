import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_firebase_database/page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //must to call to user firebase core
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
      //phù hợp mật độ điểm ảnh trên desktop app
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: LoginScreen(),
  ));
}




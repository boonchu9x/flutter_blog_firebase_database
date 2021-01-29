import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Authentication {}

class Auth extends Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //async(bất đồng bộ) nên khi hàm này chạy xong mới chạy các hàm khác
  // password không nên trim()
  Future<String> signInWithMailAndPass(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password)) as FirebaseUser;
    return user.uid;
  }

  //async(bất đồng bộ)
  // password không nên trim()
  Future<String> createUserRegister(String email, String pass) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: pass) as FirebaseUser;
    return user.uid;
  }

  //async(bất đồng bộ)
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignIn() async {
    return await _firebaseAuth.currentUser != null;
  }

  Future<String> getUser() async {
    return await _firebaseAuth.currentUser.uid;
  }
}

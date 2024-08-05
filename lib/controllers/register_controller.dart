// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxString _error = RxString('');
  String? get error => _error.value;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed('/home'); 
    } catch (e) {
      print(e);
      _error.value = 'Registration failed. Please try again.';
    }
}


  void validatePasswords() {
    if (confirmPasswordController.text != passwordController.text) {
      _error.value = 'Passwords do not match';
    } else {
      _error.value = '';
    }
  }
}

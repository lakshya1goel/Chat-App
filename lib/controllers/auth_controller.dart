import 'package:chatapp/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var isObscure = true.obs;
  var visible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void signIn() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        visible.value = true;
        userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Get.off(ChatPage(email: emailController.text));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } finally {
        visible.value = false;
      }
    }
  }
}

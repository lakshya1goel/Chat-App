import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatController extends GetxController {
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();
  var isLoading = false.obs;

  void sendMessage(String email) async {
    if (messageController.text.isNotEmpty) {
      try {
        isLoading.value = true;
        await fs.collection('Messages').add({
          'message': messageController.text.trim(),
          'time': DateTime.now(),
          'email': email,
        });
        messageController.clear();
      } finally {
        isLoading.value = false;
      }
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/login'); // Navigate to login page
    } catch (e) {
      // Handle errors here
      print("Error signing out: $e");
    }
  }
}

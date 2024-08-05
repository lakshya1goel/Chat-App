import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageController extends GetxController {
  final String email;
  MessageController({required this.email});

  final Rx<Stream<QuerySnapshot>> _messageStream = 
      Rx<Stream<QuerySnapshot>>(FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots());

  Stream<QuerySnapshot> get messageStream => _messageStream.value;
}

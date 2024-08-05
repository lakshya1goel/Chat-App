import 'package:chatapp/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message.dart';

class ChatPage extends StatelessWidget {
  final String email;
  const ChatPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageScreen(email: email),
          ),
          Obx(() => chatController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: chatController.messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple[100],
                      hintText: 'Message',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => chatController.sendMessage(email),
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

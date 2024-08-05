import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/message.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', 
      getPages: [
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeeScreen()),
        GetPage(
          name: '/chat',
          page: () => ChatPage(email: Get.parameters['email'] ?? ''),
        ),
        GetPage(
          name: '/messages',
          page: () => MessageScreen(email: Get.parameters['email'] ?? ''),
        ),
      ],
    );
  }
}

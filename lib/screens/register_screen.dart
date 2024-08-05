import 'package:chatapp/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: registerController.emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: registerController.passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: registerController.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Confirm Password',
                  ),
                  onChanged: (value) {
                    registerController.validatePasswords();
                  },
                ),
                SizedBox(height: 20),
                Text(
                  registerController.error ?? '',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      height: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.white,
                    ),
                    MaterialButton(
                      height: 40,
                      onPressed: () async {
                        try {
                          registerController.register();
                          print("Register method called successfully.");
                        } catch (e) {
                          print("Error calling register: $e");
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

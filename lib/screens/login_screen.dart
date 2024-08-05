import 'package:chatapp/controllers/auth_controller.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue[900],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.70,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: authController.emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-z]")
                                .hasMatch(value)) {
                              return "Please enter a valid email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: authController.passwordController,
                          obscureText: authController.isObscure.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return "Please enter a valid password min. 6 characters";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          elevation: 5.0,
                          height: 40,
                          onPressed: authController.signIn,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: authController.visible.value,
                          child: Container(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      elevation: 5.0,
                      height: 40,
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      color: Colors.blue[900],
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

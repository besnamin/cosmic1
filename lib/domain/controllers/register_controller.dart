import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late bool _success;
  late String _userEmail;  


  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

   // Example code for registration.
  Future<void> register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;
    if (user != null) {
      _success = true;
      print('Registro Ok');
      Future.delayed(
        Duration(seconds: 2),
        (){
          Get.toNamed('/home');
        },
      );
      _userEmail = user.email!;
    } else{
      _success = false;
    }
  }

}
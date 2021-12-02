import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


// Example code of how to sign in with email and password.
  Future<void> signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user!;
      Get.snackbar('Bienvenido', 'Su ingreso ha sido exitoso');
      print('Ingreso satisfactorio');
      Future.delayed(
        const Duration(seconds: 2),
        (){
          Get.toNamed('/home');
        }
      );
    } catch (e){
      Get.snackbar('Error', 'Fallo en la autenticación', 
      snackPosition: SnackPosition.TOP);
    }
  }

 /// Example code for sign out.
  Future<void> _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      Get.snackbar('Out', 'No hay sesión iniciada', 
      snackPosition: SnackPosition.TOP);
      return;
    }

    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', '$uid ha cerrado sesión correctamente',
    snackPosition: SnackPosition.TOP);
    Get.toNamed('/');
    
  }

  static userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

}


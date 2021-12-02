
import 'package:cosmic1/domain/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 40,
            ),
            _loginForm(context),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              child: const Text('Registrarse',
                  style: TextStyle(color: Colors.red, fontSize: 14)),
              onPressed: () {
                Get.toNamed('/signup');
              },
            ),
          ],
        );
      },
    ));
    //  );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width * 0.8,
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              _crearEmail(),
              const SizedBox(
                height: 30,
              ),
              _crearPassword(),
              const SizedBox(
                height: 40,
              ),
              _crearBoton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearEmail() {
    return TextFormField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.email_outlined,
              color: Colors.red,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            // hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
            labelStyle: TextStyle(color: Colors.black54)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese un correo';
          }
          return null;
        });
  }

  Widget _crearPassword() {
    return TextFormField(
        controller: controller.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock_outline,
              color: Colors.red,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            // hintText: 'ejemplo@correo.com',
            labelText: 'Contraseña',
            labelStyle: TextStyle(color: Colors.black54)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese una contraseña';
          }
          return null;
        });
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton(
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 90.0, vertical: 12.0),
            child: const Text('Ingresar')),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            await controller.signInWithEmailAndPassword();
          }
        });
  }
}
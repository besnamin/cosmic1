import 'package:cosmic1/domain/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends  StatelessWidget {
  final controller = Get.put(LoginRegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<LoginRegisterController>(
      builder: (_) {
        return SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Container(
                  height: 90,
                ),
              ),
              const Text(
                'Registro',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              _loginForm(context),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                child: const Text('Ya tengo una cuenta',
                    style: TextStyle(color: Colors.red, fontSize: 14)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
              _crearUsuario(),
              const SizedBox(
                height: 30,
              ),
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

  Widget _crearUsuario() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.red,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54)),
          // hintText: 'ejemplo@correo.com',
          labelText: 'Nombre de usuario',
          labelStyle: TextStyle(color: Colors.black54)),
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
          if (value == null || value.isEmpty)
            return 'Ingrese un correo electronico';
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
          if (value == null || value.isEmpty) return 'Ingrese una contraseña';
          return null;
        });
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 12.0),
          child: const Text('Registrarse')),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red,
      textColor: Colors.white,
      onPressed: () async {
        if (controller.formKey.currentState!.validate()) {
          controller.register();
        }
      },
    );
  }
}
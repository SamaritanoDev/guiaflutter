// ignore_for_file: sort_child_properties_last

import 'package:appsaveproducts/providers/login_form_provider.dart';
import 'package:appsaveproducts/ui/ui.dart';
import 'package:appsaveproducts/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Iniciar sesión',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 10),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Crear cuenta nueva',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'samaritanodev@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_sharp),

            onChanged: (value) => loginForm.email = value,
            //validation
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no puede ser un correo';
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline),

            onChanged: (value) => loginForm.password = value,
            //validation
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : 'La contraseña debe contener 8 caracteres';
            },
          ),
          const SizedBox(height: 25),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Cargando...' : 'Iniciar sesión',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    //desactivar un boton

                    //esconder el teclado
                    FocusScope.of(context).unfocus();
                    //todo: login form
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    Future.delayed(const Duration(seconds: 2));
                    loginForm.isLoading = false;

                    Navigator.pushReplacementNamed(context, 'home');
                  },
          ),
        ],
      ),
    );
  }
}

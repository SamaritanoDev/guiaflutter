import 'package:appsaveproducts/ui/ui.dart';
import 'package:appsaveproducts/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                    const SizedBox(height: 30),
                    const _LoginForm(),
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
    return Container(
      //todo: mantener la referencia al key
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'samaritanodev@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_sharp),
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
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

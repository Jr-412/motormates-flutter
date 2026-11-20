import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset('assets/images/logo_definitivo.png', height: 80),
                const SizedBox(height: 24),
                const Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Inicia sesión para seguir conectado',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                const CustomTextField(
                  label: 'Correo electrónico',
                  hint: 'tucorreo@ejemplo.com',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'Contraseña',
                  hint: '••••••••',
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Iniciar sesión',
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Crear cuenta',
                  isOutlined: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
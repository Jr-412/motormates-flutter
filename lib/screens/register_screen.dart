import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Únete a MotorMates',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Comparte tu pasión por los autos',
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 28),
              const CustomTextField(
                label: 'Nombre completo',
                hint: 'Tu nombre',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Confirmar contraseña',
                hint: '••••••••',
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (value) {
                      setState(() {
                        _termsAccepted = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Acepto los Términos de servicio y la Política de privacidad',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Completar Registro',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:motormates_flutter/screens/feed_screen.dart';
import 'package:motormates_flutter/screens/new_review_screen.dart';
import 'package:motormates_flutter/screens/profile_screen.dart';
import 'package:motormates_flutter/screens/register_screen.dart';
import 'package:motormates_flutter/screens/sign_in_screen.dart';
import 'package:motormates_flutter/screens/vehicle_detail_screen.dart';

void main() {
  runApp(const MotorMatesApp());
}

class MotorMatesApp extends StatelessWidget {
  const MotorMatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotorMates',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFB3282D), // MotorMatesRed
          secondary: Color(0xFFE05257), // MotorMatesRedLight
          surface: Color(0xFF1E1E1E), // MotorMatesSurface
          surfaceContainerHighest: Color(0xFF534342), // SurfaceVariant
          background: Color(0xFF0A0A0A),
          onSurfaceVariant: Color(0xFF9B9B9B), // TextSecondary
        ),
        useMaterial3: true,
      ),
      home: const MainDevMenu(),
    );
  }
}

// Menú temporal para navegar y revisar las 6 pantallas exigidas
class MainDevMenu extends StatefulWidget {
  const MainDevMenu({super.key});

  @override
  State<MainDevMenu> createState() => _MainDevMenuState();
}

class _MainDevMenuState extends State<MainDevMenu> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const SignInScreen(),
    const RegisterScreen(),
    const FeedScreen(),
    const VehicleDetailScreen(),
    const ProfileScreen(),
    const NewReviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Registro'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Detalle'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.rate_review), label: 'Reseña'),
        ],
      ),
    );
  }
}
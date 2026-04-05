import 'package:flutter/material.dart';
import 'package:task4/features/splash/splash_screen.dart';
import 'package:task4/features/auth/Ui/login_screen.dart';
import 'package:task4/features/auth/Ui/register_screen.dart';
import 'package:task4/features/auth/Ui/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
        'otp': (context) => const OtpScreen(),
      },
      initialRoute: '/',
    );
  }
}

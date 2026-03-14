import 'package:flutter/material.dart';
import 'package:task4/features/splash/splash_screen.dart';
import 'package:task4/features/auth/login/login_screen.dart';
import 'package:task4/features/auth/register/register_screen.dart';
import 'package:task4/features/auth/otp/otp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'otp': (context) => OtpScreen(),
      },
      initialRoute: '/',
    );
  }
}

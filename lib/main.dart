import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/features/auth/auth_bloc/auth_bloc.dart';
import 'package:task4/features/auth/Ui/login_screen.dart';
import 'package:task4/features/auth/Ui/otp_screen.dart';
import 'package:task4/features/auth/Ui/register_screen.dart';
import 'package:task4/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegisterScreen(),
          'otp': (context) => const OtpScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}

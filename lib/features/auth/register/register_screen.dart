import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildForm(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      height: 180,
      color: Color(0xFF1AACB0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Create Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Join ALmasar today',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          buildNameField(),
          SizedBox(height: 12),
          buildEmailField(),
          SizedBox(height: 12),
          buildPhoneField(),
          SizedBox(height: 12),
          buildPasswordField(),
          SizedBox(height: 24),
          buildRegisterButton(),
          SizedBox(height: 16),
          buildLoginRow(),
        ],
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Full Name',
        prefixIcon: Icon(Icons.person_outline, color: Color(0xFF1AACB0)),
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF1AACB0)),
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildPhoneField() {
    return TextField(
      controller: phoneController,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        prefixIcon: Icon(Icons.phone_outlined, color: Color(0xFF1AACB0)),
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF1AACB0)),
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildRegisterButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'otp');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1AACB0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? '),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Color(0xFFE63950),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
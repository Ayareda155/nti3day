import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/features/auth/auth_bloc/auth_bloc.dart';
import 'package:task4/features/auth/data/models/user_data_class.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Register Successfully")),
          );
          Navigator.pushNamed(context, 'otp');
        } else if (state is RegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? "Register Failed")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [buildHeader(), buildForm(context, state)],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      height: 180,
      color: const Color(0xFF1AACB0),
      child: const Center(
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
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, AuthState state) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          buildTextField(nameController, 'Full Name', Icons.person_outline),
          const SizedBox(height: 12),
          buildTextField(emailController, 'Email', Icons.email_outlined),
          const SizedBox(height: 12),
          buildTextField(phoneController, 'Phone Number', Icons.phone_outlined),
          const SizedBox(height: 12),
          buildTextField(
            passwordController,
            'Password',
            Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 24),
          buildRegisterButton(context, state),
          const SizedBox(height: 16),
          buildLoginRow(),
        ],
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) => value!.isEmpty ? 'Field required' : null,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF1AACB0)),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildRegisterButton(BuildContext context, AuthState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: state is RegisterLoadingState
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                    RegisterEvent(
                      UserDataClass(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    ),
                  );
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1AACB0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state is RegisterLoadingState
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
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
        const Text('Already have an account? '),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
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

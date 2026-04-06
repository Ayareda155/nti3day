import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/features/auth/auth_bloc/auth_bloc.dart';
import 'package:task4/features/auth/data/models/user_data_class.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Successfully")));
        } else if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? "Login Failed")),
          );
        } else if (state is LoginWithGoogleSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Google Login Success")));
        } else if (state is LoginWithGoogleFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? "Google Login Failed"),
            ),
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
      height: 160,
      color: const Color(0xFF1AACB0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite,
                color: Color(0xFFE63950),
                size: 35,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ALmasar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          buildTextField(emailController, 'Email', Icons.email_outlined),
          const SizedBox(height: 12),
          buildTextField(
            passwordController,
            'Password',
            Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 24),
          buildLoginButton(context, state),
          const SizedBox(height: 12),
          buildGoogleButton(context, state),
          const SizedBox(height: 16),
          buildRegisterRow(),
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
      validator: (value) => value!.isEmpty ? 'Required' : null,
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

  Widget buildLoginButton(BuildContext context, AuthState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: state is LoginLoadingState
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                    LoginEvent(
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
        child: state is LoginLoadingState
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
      ),
    );
  }

  Widget buildGoogleButton(BuildContext context, AuthState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: state is LoginWithGoogleLoadingState
            ? null
            : () {
                context.read<AuthBloc>().add(LoginWithGoogleEvent());
              },
        icon: state is LoginWithGoogleLoadingState
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.g_mobiledata, size: 30),
        label: const Text('Sign in with Google'),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black54,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'register'),
          child: const Text(
            'Register',
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

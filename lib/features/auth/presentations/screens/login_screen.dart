import 'package:ezovion_task/core/theme/app_colors.dart';
import 'package:ezovion_task/core/widgets/common_button.dart';
import 'package:ezovion_task/core/widgets/common_text_field.dart';
import 'package:ezovion_task/core/widgets/snackbar.dart';
import 'package:ezovion_task/features/auth/bloc/auth_bloc.dart';
import 'package:ezovion_task/features/auth/bloc/auth_event.dart';
import 'package:ezovion_task/features/auth/bloc/auth_state.dart';
import 'package:ezovion_task/features/auth/presentations/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(user: state.user),
              ),
              (route) => false, // removes EVERYTHING behind
            );

            snackBar(context, 'Login successful!', true);
          } else if (state is AuthError) {
            snackBar(context, state.message, false);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo or App Name
                    Icon(Icons.task_alt, size: 80, color: AppColors.accent),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 48),

                    // Email Field
                    CommonTextField(
                      controller: emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    CommonTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),

                    // Login Button
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CommonButton(
                          onPressed: () {
                            // Move validation to BLoC by sending raw data
                            context.read<AuthBloc>().add(
                              LoginRequested(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          text: 'Login',
                          loading: state is AuthLoading,
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          buttonName: 'Sign Up',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

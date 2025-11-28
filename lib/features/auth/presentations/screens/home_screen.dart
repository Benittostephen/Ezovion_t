import 'package:ezovion_task/core/theme/app_colors.dart';
import 'package:ezovion_task/core/widgets/common_dialog.dart';
import 'package:ezovion_task/features/auth/bloc/auth_bloc.dart';
import 'package:ezovion_task/features/auth/bloc/auth_state.dart';
import 'package:ezovion_task/features/auth/models/user.dart';
import 'package:ezovion_task/features/auth/presentations/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CommonDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Home',
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.grey[800]),
              onPressed: () => _handleLogout(context),
              tooltip: 'Logout',
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                Text(
                  user.name ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  user.email ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

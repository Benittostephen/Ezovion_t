import 'package:ezovion_task/core/theme/theme_color.dart';
import 'package:ezovion_task/features/auth/bloc/auth_bloc.dart';
import 'package:ezovion_task/features/auth/presentations/screens/login_screen.dart';
import 'package:ezovion_task/features/auth/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) =>
            AuthBloc(authRepository: context.read<AuthRepository>()),
        child: MaterialApp(
          title: 'Flutter Login & Signup',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const LoginScreen(),
        ),
      ),
    );
  }
}

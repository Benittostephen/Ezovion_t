import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    // Validate inputs
    if (event.email.isEmpty) {
      emit(AuthError(message: 'Email cannot be empty'));
      return;
    }
    
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
      emit(AuthError(message: 'Please enter a valid email'));
      return;
    }
    
    if (event.password.isEmpty) {
      emit(AuthError(message: 'Password cannot be empty'));
      return;
    }
    
    try {
      final isLoggedIn = await _authRepository.login(
        event.email,
        event.password,
      );
      if (isLoggedIn) {
        final user = User(name: '', email: event.email);
        emit(Authenticated(user: user));
      } else {
        emit(AuthError(message: 'Invalid credentials'));
      }
    } catch (e) {
      emit(AuthError(message: 'An error occurred during login'));
    }
  }

  void _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    // Validate inputs
    if (event.name.isEmpty) {
      emit(AuthError(message: 'Name cannot be empty'));
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
      emit(AuthError(message: 'Please enter a valid email'));
      return;
    }

    if (event.password.length < 6) {
      emit(AuthError(message: 'Password must be at least 6 characters'));
      return;
    }

    if (event.password != event.confirmPassword) {
      emit(AuthError(message: 'Passwords do not match'));
      return;
    }

    try {
      final isSignedUp = await _authRepository.signup(
        event.name,
        event.email,
        event.password,
      );

      if (isSignedUp) {
        // After successful signup, redirect to login
        emit(
          Authenticated(
            user: User(name: event.name, email: event.email),
          ),
        );
      } else {
        emit(AuthError(message: 'Signup failed'));
      }
    } catch (e) {
      emit(AuthError(message: 'An error occurred during signup'));
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    emit(LogOut());
  }
}

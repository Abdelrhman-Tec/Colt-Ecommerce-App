import 'package:colt_ecommerce_app/core/databases/firebase/firebase_service.dart';
import 'package:colt_ecommerce_app/core/errors/firebase_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState<User?>> {
  final FirebaseAuthService _auth;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthCubit(this._auth) : super(AuthState.initial());

  Future<void> login() async {
    emit(AuthState.loading());
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(AuthState.success(data: user));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(message: FirebaseErrorHandler.handleAuthError(e)));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> register() async {
    emit(AuthState.loading());
    try {
      final user = await _auth.signUpWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(AuthState.success(data: user));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(message: FirebaseErrorHandler.handleAuthError(e)));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> resetPassword() async {
    emit(const AuthState.loading());
    try {
      await _auth.sendPasswordResetEmail(emailController.text.trim());
      emit(AuthState.success(data: null));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(message: FirebaseErrorHandler.handleAuthError(e)));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthState.loading());
    try {
      await _auth.signOut();
      emit(AuthState.success(data: null));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(AuthState.loading());
    try {
      final userCredential = await _auth.signInFacebook();
      emit(AuthState.success(data: userCredential));
    } on FirebaseAuthException catch (e) {
      emit(AuthState.error(message: FirebaseErrorHandler.handleAuthError(e)));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }
}

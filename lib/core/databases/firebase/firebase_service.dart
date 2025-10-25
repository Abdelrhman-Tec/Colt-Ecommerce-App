import 'package:colt_ecommerce_app/core/errors/firebase_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Get current user
  User? get currentUser => _auth.currentUser;

  // Get auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //Email & Password Sign Up
  Future<User?> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  //Email & Password Sign In
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  //Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw 'Sign out failed: $e';
    }
  }

  //Send Password Reset Email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      throw 'Failed to send reset email: $e';
    }
  }

  bool get isLoggedIn => _auth.currentUser != null;

  //Verify Email
  Future<void> sendEmailVerification() async {
    try {
      await currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      throw 'Failed to send verification email: $e';
    }
  }

  Future<User?> signInFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success && result.accessToken != null) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } else if (result.status == LoginStatus.cancelled) {
      throw 'Facebook login was cancelled by the user.';
    } else {
      throw 'Facebook login failed: ${result.message}';
    }
  }

  //Check if email is verified
  bool get isEmailVerified => currentUser?.emailVerified ?? false;
}

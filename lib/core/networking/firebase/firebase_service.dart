import 'dart:developer';

import 'package:colt_ecommerce_app/core/errors/firebase_error_handler.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Get auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Helper method for translations
  String _getTranslation(String key) {
    try {
      switch (key) {
        case 'unexpectedError':
          return T.current.unexpectedError;
        case 'signOutFailed':
          return T.current.signOutFailed;
        case 'failedToSendResetEmail':
          return T.current.failedToSendResetEmail;
        case 'failedToSendVerificationEmail':
          return T.current.failedToSendVerificationEmail;
        case 'facebookLoginCancelled':
          return T.current.facebookLoginCancelled;
        case 'facebookLoginFailed':
          return T.current.facebookLoginFailed;
        default:
          return key;
      }
    } catch (e) {
      return key;
    }
  }

  //Email & Password Sign Up
  Future<User?> signUpWithEmailAndPassword({
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
      throw '${_getTranslation('unexpectedError')}: $e';
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
      log(userCredential.user!.email.toString());
      log(userCredential.user!.uid.toString());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      throw '${_getTranslation('unexpectedError')}: $e';
    }
  }

  //Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw '${_getTranslation('signOutFailed')}: $e';
    }
  }

  //Send Password Reset Email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      log('Password reset email sent successfully');
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.handleAuthError(e);
    } catch (e) {
      log('Error sending password reset email: $e');
      throw '${_getTranslation('failedToSendResetEmail')}: $e';
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
      throw '${_getTranslation('failedToSendVerificationEmail')}: $e';
    }
  }

  Future<User?> signInFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success && result.accessToken != null) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      log(userCredential.user.toString());
      log(userCredential.user!.email.toString());
      log(userCredential.user!.uid.toString());
      log(userCredential.user!.displayName.toString());
      return userCredential.user;
    } else if (result.status == LoginStatus.cancelled) {
      throw _getTranslation('facebookLoginCancelled');
    } else {
      throw '${_getTranslation('facebookLoginFailed')}: ${result.message}';
    }
  }

  //Check if email is verified
  bool get isEmailVerified => currentUser?.emailVerified ?? false;
}

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  // Handle Authentication Errors
  static String handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'Invalid email address format';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email is already registered';
      case 'weak-password':
        return 'Password is too weak';
      case 'operation-not-allowed':
        return 'This operation is not allowed';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'requires-recent-login':
        return 'Please log in again to perform this action';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different sign-in method';
      case 'invalid-credential':
        return 'The provided credential is malformed or has expired';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user';
      case 'user-mismatch':
        return 'The supplied credentials do not match the currently signed in user';
      case 'provider-already-linked':
        return 'This provider is already linked to the user';
      case 'no-such-provider':
        return 'No such provider is linked to the user';
      case 'popup-blocked':
        return 'Popup has been blocked by the browser';
      case 'popup-closed-by-user':
        return 'Popup closed before completing sign-in';
      case 'unauthorized-domain':
        return 'This domain is not authorized for OAuth operations';
      case 'internal-error':
        return 'An internal error occurred, try again later';
      case 'timeout':
        return 'The operation timed out, please try again';
      case 'app-not-authorized':
        return 'This app is not authorized to perform this operation';
      case 'invalid-verification-code':
        return 'The SMS verification code is invalid';
      case 'invalid-verification-id':
        return 'The SMS verification ID is invalid';
      case 'session-expired':
        return 'Your session has expired, please try again';
      case 'quota-exceeded':
        return 'Request quota exceeded, try again later';
      default:
        return 'Authentication failed: ${error.message}';
    }
  }

  // Handle Firestore Errors
  static String handleFirestoreError(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return 'You don\'t have permission to access this data';
      case 'not-found':
        return 'Requested document not found';
      case 'already-exists':
        return 'Document already exists';
      case 'resource-exhausted':
        return 'Quota exceeded. Please try again later';
      case 'failed-precondition':
        return 'Operation was rejected';
      case 'unavailable':
        return 'Service is temporarily unavailable';
      case 'deadline-exceeded':
        return 'Request timeout. Please try again';
      default:
        return 'Database error: ${error.message}';
    }
  }

  // Handle Storage Errors
  static String handleStorageError(FirebaseException error) {
    switch (error.code) {
      case 'object-not-found':
        return 'File not found';
      case 'bucket-not-found':
        return 'Storage bucket not found';
      case 'project-not-found':
        return 'Project not found';
      case 'quota-exceeded':
        return 'Storage quota exceeded';
      case 'unauthenticated':
        return 'User authentication required';
      case 'unauthorized':
        return 'User not authorized to perform this action';
      case 'retry-limit-exceeded':
        return 'Maximum operations limit exceeded';
      case 'invalid-checksum':
        return 'File corruption detected';
      case 'canceled':
        return 'Operation was canceled';
      default:
        return 'Storage error: ${error.message}';
    }
  }

  // Generic Error Handler
  static String handleGenericError(dynamic error) {
    if (error is FirebaseAuthException) {
      return handleAuthError(error);
    } else if (error is FirebaseException) {
      return handleFirestoreError(error);
    } else if (error is Exception) {
      return 'Unexpected error: ${error.toString()}';
    } else {
      return 'An unknown error occurred';
    }
  }
}

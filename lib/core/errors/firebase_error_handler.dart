import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  // Handle Authentication Errors
  static String handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return T.current.firebaseInvalidEmail;
      case 'user-disabled':
        return T.current.firebaseUserDisabled;
      case 'user-not-found':
        return T.current.firebaseUserNotFound;
      case 'wrong-password':
        return T.current.firebaseWrongPassword;
      case 'email-already-in-use':
        return T.current.firebaseEmailAlreadyInUse;
      case 'weak-password':
        return T.current.firebaseWeakPassword;
      case 'operation-not-allowed':
        return T.current.firebaseOperationNotAllowed;
      case 'too-many-requests':
        return T.current.firebaseTooManyRequests;
      case 'network-request-failed':
        return T.current.firebaseNetworkRequestFailed;
      case 'requires-recent-login':
        return T.current.firebaseRequiresRecentLogin;
      case 'account-exists-with-different-credential':
        return T.current.firebaseAccountExistsWithDifferentCredential;
      case 'invalid-credential':
        return T.current.firebaseInvalidCredential;
      case 'credential-already-in-use':
        return T.current.firebaseCredentialAlreadyInUse;
      case 'user-mismatch':
        return T.current.firebaseUserMismatch;
      case 'provider-already-linked':
        return T.current.firebaseProviderAlreadyLinked;
      case 'no-such-provider':
        return T.current.firebaseNoSuchProvider;
      case 'popup-blocked':
        return T.current.firebasePopupBlocked;
      case 'popup-closed-by-user':
        return T.current.firebasePopupClosedByUser;
      case 'unauthorized-domain':
        return T.current.firebaseUnauthorizedDomain;
      case 'internal-error':
        return T.current.firebaseInternalError;
      case 'timeout':
        return T.current.firebaseTimeout;
      case 'app-not-authorized':
        return T.current.firebaseAppNotAuthorized;
      case 'invalid-verification-code':
        return T.current.firebaseInvalidVerificationCode;
      case 'invalid-verification-id':
        return T.current.firebaseInvalidVerificationId;
      case 'session-expired':
        return T.current.firebaseSessionExpired;
      case 'quota-exceeded':
        return T.current.firebaseQuotaExceeded;
      default:
        return '${T.current.firebaseAuthFailed}: ${error.message}';
    }
  }
}

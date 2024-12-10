import 'package:firebase_auth/firebase_auth.dart';
import 'package:paypilot/exceptions/app_exception.dart';

class AuthenticationService {
  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;

  Future<bool> reloadCurrentUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();

      return FirebaseAuth.instance.currentUser != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "user-disabled") {
        return false;
      } else {
        // TODO: log error
        throw AppException(e.message!);
      }
    } catch (e) {
      // TODO: log error
      rethrow;
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw const AppException("Sign in failed");
      } else {
        // TODO: log error
        throw AppException(e.message!);
      }
    } catch (e) {
      // TODO: log error
      rethrow;
    }
  }

  Future<String> signUpUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      // TODO: log error
      throw AppException(e.message!);
    } catch (e) {
      // TODO: log error
      rethrow;
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      AuthCredential credential = EmailAuthProvider.credential(
          email: user!.email!, password: currentPassword);
      await user.reauthenticateWithCredential(credential);

      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      // TODO: log error
      throw AppException(e.message!);
    } catch (e) {
      // TODO: log error
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // TODO: log error
      throw AppException(e.message!);
    } catch (e) {
      // TODO: log error
      rethrow;
    }
  }
}

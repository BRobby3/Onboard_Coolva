import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Provide the web client ID when initializing GoogleSignIn for the web
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            "916306337305-3dalk534j7krogjeneid4p7079te8va4.apps.googleusercontent.com", // <-- Add this line!
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in flow
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase Authentication using the credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Catch any errors during the sign-in process
      print('Google Sign-In error: $e');
      // You might want to log this error properly or show a user-friendly message
      return null;
    }
  }
}

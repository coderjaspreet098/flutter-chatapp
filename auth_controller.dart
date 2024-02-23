import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';
import 'otp_verification_page.dart'; // Import your login page

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<bool> sendOtpToPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieve verification code (only on Android)
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: $e');

        },
        codeSent: (String verificationId, int? resendToken) {
          print('Verification ID: $verificationId');
          Get.to(OtpVerificationPage(verificationId: verificationId)); // Navigate to OTP verification page with verification ID
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Code auto-retrieval timeout');
        },
      );
      return true;
    } catch (e) {
      print('Error sending OTP: $e');
      return false;
    }
  }

  // Function to verify the OTP entered by the user
  Future<bool> verifyOtp( String verificationId ,String otp ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      return true; // OTP verification successful
    } catch (e) {
      print('Error verifying OTP: $e');
      return false; // OTP verification failed
    }
  }

  Future<bool> signUpWithEmailAndPassword(String name, String email, String password, String phone) async {
    try {
      // Check if email already exists
      bool isExistingEmail = await checkExistingEmail(email);
      if (isExistingEmail) {
        // Email already exists, return false
        return false;
      }

      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user details in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
      });

      return true; // Registration successful
    } catch (e) {
      print("Error signing up: $e");
      return false; // Registration failed
    }
  }

  Future<bool> checkExistingEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').where('email', isEqualTo: email).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking existing email: $e");
      return true; // Assume email exists to prevent signup
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true; // Login successful
    } catch (e) {
      print("Error signing in: $e");
      return false; // Login failed
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // Navigate to the login page after sign out
      Get.offAll(LoginPage());
    } catch (e) {
      print("Error signing out: $e");
      // Show error message
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      // Check if the email exists in the users collection
      bool isExistingEmail = await checkExistingEmail(email);
      if (isExistingEmail) {
        // Send password reset email
        await _auth.sendPasswordResetEmail(email: email);
        return true; // Email sent successfully
      } else {
        // Email does not exist, return false
        return false;
      }
    } catch (e) {
      print("Error sending password reset email: $e");
      return false; // Error occurred while sending email
    }
  }
}



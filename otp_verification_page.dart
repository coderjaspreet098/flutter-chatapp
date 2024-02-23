// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'auth_controller.dart';
// import 'home_screen.dart';
//
// class OtpVerificationPage extends StatelessWidget {
//   final AuthController _authController = Get.find();
//   final String verificationId; // Add verificationId field
//   final TextEditingController _otpController = TextEditingController();
//
//   // Constructor to accept verificationId
//   OtpVerificationPage({required this.verificationId});
//
//   void _verifyOtp(BuildContext context) async {
//     final String otp = _otpController.text.trim();
//
//     // Verify the OTP entered by the user using the verificationId
//     bool otpVerified = await _authController.verifyOtp(verificationId, otp);
//
//     if (otpVerified) {
//       // Navigate to the home screen
//       Get.offAll(HomePage());
//       _otpController.clear();
//     } else {
//       // Show error message
//       Get.snackbar(
//         'Error',
//         'Invalid OTP. Please try again.',
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Verification ID in OtpVerificationPage: $verificationId');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _verifyOtp(context),
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'home_screen.dart';

class OtpVerificationPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final String verificationId; // Add verificationId field
  final TextEditingController _otpController = TextEditingController();

  // Constructor to accept verificationId
  OtpVerificationPage({required this.verificationId});

  void _verifyOtp(BuildContext context) async {
    final String otp = _otpController.text.trim();

    // Verify the OTP entered by the user using the verificationId
    bool otpVerified = await _authController.verifyOtp(verificationId, otp);

    if (otpVerified) {
      // Navigate to the home screen
      Get.offAll(HomePage());
      _otpController.clear();
    } else {
      // Show error message
      Get.snackbar(
        'Error',
        'Invalid OTP. Please try again.',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Verification ID in OtpVerificationPage: $verificationId');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
        title: Text('OTP Verification'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/chatpic4.jpg'), // Your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Border color
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),// Border radius
                ),
                child: TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: InputBorder.none, // Remove default border
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Optional padding
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 40)),
                onPressed: () => _verifyOtp(context),
                child: Text('Verify OTP',style: TextStyle(color: Colors.black,fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

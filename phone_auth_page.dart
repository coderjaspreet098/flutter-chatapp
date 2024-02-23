// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'auth_controller.dart';
//
// class PhoneAuthPage extends StatelessWidget {
//   final AuthController _authController = Get.find();
//   final TextEditingController _phoneNumberController = TextEditingController();
//
//   void _sendOtp(BuildContext context) async {
//     final phoneNumber = _phoneNumberController.text.trim();
//
//     // Validate phone number
//     if (phoneNumber.isEmpty || phoneNumber.length != 10) {
//       Get.snackbar(
//         'Error',
//         'Please enter a valid phone number with country code.',
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     // Send OTP to the provided phone number
//     bool otpSent = await _authController.sendOtpToPhoneNumber(phoneNumber);
//
//     if (otpSent) {
//       // No need to navigate here, it will be handled by the codeSent callback in the AuthController
//       _phoneNumberController.clear();
//     } else {
//       // Show error message
//       Get.snackbar(
//         'Error',
//         'Failed to send OTP. Please try again.',
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Authentication'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//                 prefixText: '+91', // Display the country code as a prefix
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _sendOtp(context),
//               child: Text('Send OTP'),
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

class PhoneAuthPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _sendOtp(BuildContext context) async {
    final phoneNumber = _phoneNumberController.text.trim();

    // Validate phone number
    if (phoneNumber.isEmpty || phoneNumber.length != 10) {
      Get.snackbar(
        'Error',
        'Please enter a valid phone number with country code.',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Send OTP to the provided phone number
    bool otpSent = await _authController.sendOtpToPhoneNumber(phoneNumber);

    if (otpSent) {
      // No need to navigate here, it will be handled by the codeSent callback in the AuthController
      _phoneNumberController.clear();
    } else {
      // Show error message
      Get.snackbar(
        'Error',
        'Failed to send OTP. Please try again.',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
        title: Text('Phone Authentication'),
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
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixText: '+91', // Display the country code as a prefix
                    border: InputBorder.none, // Remove default TextField border
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Optional padding
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 40)),
                onPressed: () => _sendOtp(context),
                child: Text('Send OTP',style: TextStyle(color: Colors.black,fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


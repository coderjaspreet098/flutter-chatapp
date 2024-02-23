// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'auth_controller.dart';
// import 'login_screen.dart';
//
// class ForgotPasswordPage extends StatelessWidget {
//   final AuthController _authController = Get.find();
//   final TextEditingController _emailController = TextEditingController();
//
//   void _submitForm(BuildContext context) async {
//     final email = _emailController.text.trim();
//
//     final success = await _authController.sendPasswordResetEmail(email);
//
//     if (success) {
//       // Show success message
//       Get.snackbar(
//         'Success',
//         'Password reset email sent successfully.',
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       Get.off(LoginPage());
//
//       // Clear email field
//       _emailController.clear();
//     } else {
//       // Show error message
//       Get.snackbar(
//         'Error',
//         'Email not found. Please enter a valid email.',
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
//         title: Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _submitForm(context),
//               child: Text('Send Reset Email'),
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
import 'login_screen.dart';

class ForgotPasswordPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();

  void _submitForm(BuildContext context) async {
    final email = _emailController.text.trim();

    final success = await _authController.sendPasswordResetEmail(email);

    if (success) {
      // Show success message
      Get.snackbar(
        'Success',
        'Password reset email sent successfully.',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.off(LoginPage());

      // Clear email field
      _emailController.clear();
    } else {
      // Show error message
      Get.snackbar(
        'Error',
        'Email not found. Please enter a valid email.',
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
        title: Text('Forgot Password'),
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
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none, // Remove default TextField border
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Optional padding
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(180, 50)),
                onPressed: () => _submitForm(context),
                child: Text('Send Reset Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


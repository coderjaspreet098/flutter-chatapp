// import 'package:chatapp/phone_auth_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'auth_controller.dart';
// import 'forget_password.dart';
// import 'signup_screen.dart';
//
// class LoginPage extends StatelessWidget {
//   final AuthController _authController = Get.find();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void _submitForm(BuildContext context) async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//
//     final success = await _authController.signInWithEmailAndPassword(email, password);
//
//     if (success) {
//       // Navigate to home page
//       Get.off(PhoneAuthPage());
//       _emailController.clear();
//       _passwordController.clear();
//     } else {
//       // Show error dialog
//       Get.snackbar(
//         'Error',
//         'Incorrect email or password. Please try again.',
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
//         title: Text('Login'),
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
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _submitForm(context),
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.to(SignupPage());
//               },
//               child: Text('Don\'t have an account? Sign Up'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.to(ForgotPasswordPage()); // Navigate to forgot password page
//               },
//               child: Text('Forgot Password?'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:chatapp/phone_auth_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'forget_password.dart';
import 'signup_screen.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final success =
    await _authController.signInWithEmailAndPassword(email, password);

    if (success) {
      // Navigate to home page
      Get.off(PhoneAuthPage());
      _emailController.clear();
      _passwordController.clear();
    } else {
      // Show error dialog
      Get.snackbar(
        'Error',
        'Incorrect email or password. Please try again.',
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
        title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/chatpic4.jpg"),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(130, 50)),
                onPressed: () => _submitForm(context),
                child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              TextButton(
                onPressed: () {
                  Get.to(SignupPage());
                },
                child: Text('Don\'t have an account? Sign Up',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              TextButton(
                onPressed: () {
                  Get.to(ForgotPasswordPage()); // Navigate to forgot password page
                },
                child: Text('Forgot Password?',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


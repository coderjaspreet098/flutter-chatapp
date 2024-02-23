import 'package:chatapp/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart'; // Import your AuthController

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC4qOo4Ce9G_-iD5EzNHqMw0QXEC2h1egU",
          appId: "1:386024970385:android:ebeb76575686348d910730",
          messagingSenderId: "386024970385",
          projectId: "chatapp-9bf95",
          storageBucket: "chatapp-9bf95.appspot.com"
      )
  );

  // Initialize AuthController with GetX
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false ,
      home: LoginPage(),
    );
  }
}

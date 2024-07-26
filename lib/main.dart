import 'package:chatting_app/Auth/auth_gate.dart';
import 'package:chatting_app/Auth/login_or_register.dart';
import 'package:chatting_app/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    if (e is FirebaseException && e.code == 'duplicate-app') {
      // Firebase already initialized, use the existing instance
    } else {
      // Handle other errors
      print('Error initializing Firebase: $e');
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}

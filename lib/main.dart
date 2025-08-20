import 'package:flutter/material.dart';
import 'package:taskmannager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmannager/screen/onboarding/loginScreen.dart';
import 'package:taskmannager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmannager/screen/onboarding/registrationScreen.dart';
import 'package:taskmannager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmannager/screen/onboarding/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Mannger",
      initialRoute: '/',
      routes: {
        '/':(context)=> splashScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationsScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen()
      },
    );
  }
}

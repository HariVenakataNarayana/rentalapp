import 'package:flutter/material.dart';
import 'package:rentalapp/pages/adddetails_page.dart';
import 'package:rentalapp/pages/login_page.dart';
import 'package:rentalapp/pages/signup_page.dart';
import 'package:rentalapp/pages/created_page.dart';
import 'package:rentalapp/pages/splash_page.dart';
import 'package:rentalapp/pages/loginotp_page.dart';
import 'package:rentalapp/pages/forgotpassword_page.dart'; // Add this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        '/login': (context) => LoginPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/signup': (context) => SignupPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/create': (context) => const CreatedPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/loginotp': (context) => const LoginotpPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/forgotpassword': (context) => const ForgotpasswordPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/Addddetails': (context) => const AddDetailsPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
        '/HomePage': (context) => const AddDetailsPage(
              titleFontSize: 24.0,
              titleFontWeight: FontWeight.bold,
            ),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rentalapp/pages/login_page.dart'; // Import the LoginPage

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
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          titleFontSize: 24.0, // Replace with your desired font size
          titleFontWeight:
              FontWeight.bold, // Replace with your desired font weight
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                colors: [
                  (Color.fromARGB(255, 7, 34, 211)),
                  Color.fromARGB(255, 29, 78, 240)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/icons8.png', // Ensure this is correct
              width: 100.0, // Adjust width as needed
              height: 100.0, // Adjust height as needed
            ),
          ),
        ],
      ),
    );
  }
}

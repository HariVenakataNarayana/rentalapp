import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rentalapp/pages/login_page.dart'; // Import the LoginPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
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
    var _duration = Duration(seconds: 3);
    return Timer(_duration, route);
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
            decoration: BoxDecoration(
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                colors: [(new Color(0xff1393aa)), new Color(0xff1fceee)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/icons.png', // Ensure this is correct
              width: 50.0, // Adjust width as needed
              height: 50.0, // Adjust height as needed
            ),
          ),
        ],
      ),
    );
  }
}

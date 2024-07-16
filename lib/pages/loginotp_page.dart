import 'dart:async'; // Make sure to import this for the Timer class
import 'package:flutter/material.dart';
import 'package:rentalapp/components/my_textfield.dart';

class LoginotpPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  LoginotpPage({
    Key? key,
    required this.titleFontSize,
    required this.titleFontWeight,
  }) : super(key: key);

  @override
  _LoginotpPageState createState() => _LoginotpPageState();
}

class _LoginotpPageState extends State<LoginotpPage> {
  final usernameController = TextEditingController();
  bool isOTPSent = false;
  int timer = 30;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (this.timer > 0) {
          this.timer--;
        } else {
          timer.cancel();
          isOTPSent = false;
          this.timer = 30; // Reset timer
        }
      });
    });
  }

  void _sendOTP() {
    setState(() {
      isOTPSent = true;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'RENTAL',
                style: TextStyle(
                  fontSize: widget.titleFontSize,
                  fontWeight: widget.titleFontWeight,
                ),
              ),
              const SizedBox(height: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Log In With Mobile',
                      style: TextStyle(
                        color: Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Phone Number',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Enter OTP',
                    obscureText: false,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isOTPSent) {
                              _sendOTP();
                            }
                          },
                          child: Text(
                            'Send the OTP',
                            style: TextStyle(
                              color: Color.fromARGB(255, 67, 13, 245),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (isOTPSent)
                          Text(
                            '($timer)',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Add your submit logic here
                        },
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

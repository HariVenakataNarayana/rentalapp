import 'package:flutter/material.dart';
import 'package:rentalapp/components/my_textfield.dart';

class ForgotpasswordPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const ForgotpasswordPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _ForgotpasswordPageState createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  final usernameController = TextEditingController();

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
                      'Log In With Email',
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
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 28, 20, 85),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Add your submit logic here
                        },
                        child: const Text(
                          'Send the Link',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

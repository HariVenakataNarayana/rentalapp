import 'package:flutter/material.dart';

import 'package:rentalapp/components/my_textfield.dart';
import 'package:rentalapp/components/square_tile.dart';
import 'package:rentalapp/pages/created_page.dart';

class SignupPage extends StatelessWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  SignupPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final reenterPasswordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

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
                fontSize: titleFontSize,
                fontWeight: titleFontWeight,
              ),
            ),

            const SizedBox(height: 70),

            // Login
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 10.0), // Adjust padding as needed
                  child: Text(
                    'Create an account',
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
                  hintText: 'Phone/Email Id',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: ' Enter Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: reenterPasswordController,
                  hintText: ' Renter Password',
                  obscureText: true,
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: 370,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatedPage(
                              titleFontSize: titleFontSize,
                              titleFontWeight: titleFontWeight,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign Up With Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Sign In with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // google + apple sign in buttons
                Center(
                  child: SizedBox(
                    width: 370,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            255, 209, 209, 209), // Background color
                        borderRadius:
                            BorderRadius.circular(12), // Border radius
                        boxShadow: [
                          // BoxShadow(
                          //   color: const Color.fromARGB(255, 170, 169, 169)
                          //       .withOpacity(0.5), // Shadow color
                          //   spreadRadius: 5, // Spread radius
                          //   blurRadius: 7, // Blur radius
                          //   offset: Offset(0, 3), // Shadow position
                          // ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0), // Padding inside the container
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the children in the row
                        children: [
                          SquareTile(imagePath: 'assets/google.png'),
                          SizedBox(
                            width: 10,
                            height: 10,
                          ), // Spacing between the button and text
                          Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

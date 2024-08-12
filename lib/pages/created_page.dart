import 'package:flutter/material.dart';
import 'package:rentalapp/pages/file_picker.dart';
import 'welcome_page.dart'; // Ensure the WelcomePage is correctly imported

class CreatedPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const CreatedPage({
    Key? key,
    required this.titleFontSize,
    required this.titleFontWeight,
  }) : super(key: key);

  @override
  _CreatedPageState createState() => _CreatedPageState();
}

class _CreatedPageState extends State<CreatedPage> {
  // Text editing controllers
  final usernameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final additionalInfoController = TextEditingController();
  final captchaController = TextEditingController();

  final ownershipController = TextEditingController();
  final insuranceController = TextEditingController();
  final complianceController = TextEditingController();

  // List of states
  final List<String> states = ['State 1', 'State 2', 'State 3', 'State 4'];
  String? selectedState;

  double buttonHeight = 50.0; // Default button height
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    additionalInfoController.addListener(_updateButtonHeight);
  }

  @override
  void dispose() {
    additionalInfoController.removeListener(_updateButtonHeight);
    additionalInfoController.dispose();
    super.dispose();
  }

  void _updateButtonHeight() {
    setState(() {
      buttonHeight = 50.0 + (additionalInfoController.text.length * 0.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Rental ',
                  style: TextStyle(
                    fontSize: widget.titleFontSize,
                    fontWeight: widget.titleFontWeight,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/access3.png', // Update this to your actual image path
                  height: 200,
                  width: 200,
                  // Set the desired height
                ),
                const SizedBox(height: 10),
                const Text(
                  'Congratulations! You have created an account successfully',
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 17, 17),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please complete your profile and upload the necessary documents to start using our platform',
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 17, 17),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // Add Image placeholder
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'First name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Last name textfield
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Company name textfield
                MyTextField(
                  controller: companyNameController,
                  hintText: 'Company Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Phone number textfield
                MyTextField(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Address textfield
                MyTextField(
                  controller: addressController,
                  hintText: 'Address',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Address line 2 textfield
                MyTextField(
                  controller: addressLine2Controller,
                  hintText: 'Address line 2',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // City textfield
                MyTextField(
                  controller: cityController,
                  hintText: 'City/Town',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Dropdown for state selection
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedState,
                    hint: const Text('Select State'),
                    items: states.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedState = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Pincode textfield
                MyTextField(
                  controller: pincodeController,
                  hintText: 'Pincode',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // File picker textfields
                FilePickerTextField(
                  hintText: 'Proof of Ownership',
                  controller: ownershipController,
                  allowedFileTypes: const ['pdf', 'jpeg'],
                ),
                const SizedBox(height: 10),
                FilePickerTextField(
                  hintText: 'Insurance Certificate',
                  controller: insuranceController,
                  allowedFileTypes: const ['pdf', 'jpeg'],
                ),
                const SizedBox(height: 10),
                FilePickerTextField(
                  hintText: 'Compliance Document',
                  controller: complianceController,
                  allowedFileTypes: const ['pdf', 'jpeg'],
                ),
                const SizedBox(height: 10),
                // Additional information textfield
                MyTextField(
                  controller: additionalInfoController,
                  hintText: 'Additional remarks',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Captcha textfield
                MyTextField(
                  controller: captchaController,
                  hintText: 'Enter Captcha',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Terms and Conditions Checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false; // Handle null value
                        });
                      },
                    ),
                    const Text(
                      'I agree to the ',
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your terms and conditions logic here
                      },
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Submit button
                SizedBox(
                  width: 370,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: isChecked
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomePage(
                                  titleFontSize: widget.titleFontSize,
                                  titleFontWeight: widget.titleFontWeight,
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 11, 11, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

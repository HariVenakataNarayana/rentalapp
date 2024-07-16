import 'package:flutter/material.dart';
import 'package:rentalapp/components/my_textfield.dart'; // Ensure this is correct
import 'package:rentalapp/pages/file_picker.dart'; // Import the custom file picker widget
import 'package:rentalapp/pages/welcome_page.dart'; // Import the WelcomePage

class CreatedPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  CreatedPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _CreatedPageState createState() => _CreatedPageState();
}

class _CreatedPageState extends State<CreatedPage> {
  // text editing controllers
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
  final photographController = TextEditingController();

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
                  'RENTAL',
                  style: TextStyle(
                    fontSize: widget.titleFontSize,
                    fontWeight: widget.titleFontWeight,
                  ),
                ),
                const SizedBox(height: 70),
                // Login
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Congratulations!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 224, 120),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Text(
                      'You have created an account successfully',
                      style: TextStyle(
                        color: Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Please complete your profile and upload the '
                      ' necessary documents to start using our platform',
                      style: TextStyle(
                        color: Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // username textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'First name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // last name textfield
                    MyTextField(
                      controller: lastNameController,
                      hintText: 'Last name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // company name textfield
                    MyTextField(
                      controller: companyNameController,
                      hintText: 'Company Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // phone number textfield
                    MyTextField(
                      controller: phoneNumberController,
                      hintText: 'Phone Number',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // address textfield
                    MyTextField(
                      controller: addressController,
                      hintText: 'Address',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // address line 2 textfield
                    MyTextField(
                      controller: addressLine2Controller,
                      hintText: 'Address line 2',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // city textfield
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
                        hint: Text('Select State'),
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
                    // pincode textfield
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
                      allowedFileTypes: ['pdf', 'jpeg'],
                    ),
                    const SizedBox(height: 10),
                    FilePickerTextField(
                      hintText: 'Insurance Certificate',
                      controller: insuranceController,
                      allowedFileTypes: ['pdf', 'jpeg'],
                    ),
                    const SizedBox(height: 10),
                    FilePickerTextField(
                      hintText: 'Compliance Document',
                      controller: complianceController,
                      allowedFileTypes: ['pdf', 'jpeg'],
                    ),
                    const SizedBox(height: 10),
                    FilePickerTextField(
                      hintText: 'Photograph',
                      controller: photographController,
                      allowedFileTypes: ['jpeg'],
                    ),
                    const SizedBox(height: 10),
                    // additional information textfield
                    MyTextField(
                      controller: additionalInfoController,
                      hintText: 'Additional remarks',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // captcha textfield
                    MyTextField(
                      controller: captchaController,
                      hintText: 'Enter Captcha',
                      obscureText: false,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Add your terms and conditions logic here
                                },
                                child: Text('Agreement: '),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 370,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomePage(
                                      titleFontSize: widget.titleFontSize,
                                      titleFontWeight: widget.titleFontWeight,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

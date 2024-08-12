import 'package:flutter/material.dart';
import 'package:rentalapp/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const WelcomePage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showDetails = false;

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of user details
    final userDetails = [
      {'label': 'Full Name', 'value': 'Sneha Patil'},
      {'label': 'Email', 'value': 'Snehapatil@mail.com'},
      {'label': 'Phone', 'value': '+919293292899'},
      {
        'label': 'Address',
        'value': 'DN Marg, Lane 34, Shinde Street, Mumbai, Maharashtra, 40001'
      },
    ];

    // List of documents
    final documents = [
      'Proof of Ownership',
      'Insurance Certificate',
      'Compliance Document',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
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
                const SizedBox(height: 10),
                Image.asset(
                  'assets/access4.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome! Sneha',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 17, 17),
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Your documents verification is under review',
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'In the meantime, you can review the details you have submitted',
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We will notify you via email once verification is complete',
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: _toggleDetails,
                                  child: Text(
                                    _showDetails
                                        ? 'Hide details'
                                        : 'View details',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 67, 13, 245),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_showDetails)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  // Using for loop to generate user details
                                  for (var detail in userDetails)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                '${detail['label']}: ${detail['value']}'),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  const Divider(color: Colors.black),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Documents:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Using for loop to generate document list with icons
                                  for (var document in documents)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              document,
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 67, 13, 245),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  const SizedBox(height: 10),
                                  RichText(
                                    text: TextSpan(
                                      text: 'We will ',
                                      style: TextStyle(
                                        fontSize: widget.titleFontSize,
                                        fontWeight: FontWeight.normal,
                                        color: const Color.fromARGB(
                                            255, 60, 60, 60),
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'notify',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' you via email once verification is complete',
                                          style: TextStyle(
                                            fontSize: widget.titleFontSize,
                                            fontWeight: FontWeight.normal,
                                            color: const Color.fromARGB(
                                                255, 24, 24, 24),
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
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  titleFontSize: widget.titleFontSize,
                                  titleFontWeight: widget.titleFontWeight,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 10, 10, 14),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 16.0),
                          ),
                          child: const Text(
                            'LogOut',
                            style: TextStyle(
                              color: Color.fromARGB(255, 247, 239, 239),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Contact:',
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                          fontWeight: widget.titleFontWeight,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'sales@rental.com',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 13, 245),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Customercare@rental.com',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 13, 245),
                        ),
                      ),
                    ],
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

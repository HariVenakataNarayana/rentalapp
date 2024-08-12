import 'package:flutter/material.dart';
import 'package:rentalapp/pages/home_page.dart'; // Ensure this path is correct

class ProfilePage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const ProfilePage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int _selectedIndex = 1; // Assuming Profile page is the second tab

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            titleFontSize: widget.titleFontSize,
            titleFontWeight: widget.titleFontWeight,
          ),
        ),
      );
    } else if (index == 1) {
      // Do nothing as we are already on the Profile page
    }
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
      backgroundColor:
          Colors.grey[300], // Set the background color for the whole page
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: widget.titleFontSize,
                    fontWeight: widget.titleFontWeight,
                    color: Colors.black, // Adjust text color if needed
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 48,
                              backgroundImage: AssetImage('assets/icon.png'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Edit profile image',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 44, 66, 230),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                // Using for loop to generate user details
                                for (var detail in userDetails)
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    margin: const EdgeInsets.only(bottom: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .grey[200], // Grey background color
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${detail['label']}: ${detail['value']}',
                                            style: const TextStyle(
                                              color: Colors.black, // Text color
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                const Divider(color: Colors.black),
                                const SizedBox(height: 10),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Documents:',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                    Text(
                                      'Edit/Add',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Using for loop to generate document list
                                for (var document in documents)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            document,
                                            style: const TextStyle(
                                              color: Color.fromARGB(255, 67, 13,
                                                  245), // Text color
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

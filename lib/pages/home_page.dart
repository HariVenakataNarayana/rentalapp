import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const HomePage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VendorPage(
        titleFontSize: titleFontSize,
        titleFontWeight: titleFontWeight,
      ),
    );
  }
}

class VendorPage extends StatelessWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  VendorPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  // Sample list of products
  final List<String> products = ["Product 1", "Product 2", "Product 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 30, 30),
              ),
              child: Text(
                'Hi Vender name ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('add new product'),
              onTap: () {
                // Handle the messages tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('List of products'),
              onTap: () {
                // Handle the profile tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Orders'),
              onTap: () {
                // Handle the settings tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Recents order'),
              onTap: () {
                // Handle the settings tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Welcome! Vendor name",
              style: TextStyle(
                  fontSize: titleFontSize, fontWeight: titleFontWeight),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (String product in products)
                  ListTile(
                    title: Text(product),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle add product button press
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text("Add your products"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(HomePage(
    titleFontSize: 24,
    titleFontWeight: FontWeight.bold,
  ));
}

import 'package:flutter/material.dart';
import 'package:rentalapp/pages/notification_page';
import 'package:rentalapp/pages/settings_page';

import 'adddetails_page.dart';
import 'productlist_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const HomePage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VendorPage(
        titleFontSize: widget.titleFontSize,
        titleFontWeight: widget.titleFontWeight,
      ),
    );
  }
}

class VendorPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const VendorPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  // Sample list of products
  final List<String> products = ["Product 1", "Product 2", "Product 3"];

  // Method to handle "Add your products" button press
  void _handleAddProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductPage(
          titleFontSize: widget.titleFontSize,
          titleFontWeight: widget.titleFontWeight,
        ),
      ),
    );
  }

  // Method to handle navigation
  void _navigateTo(String route) {
    Navigator.pop(context); // Close the drawer
    switch (route) {
      case 'Add new product':
        _handleAddProduct();
        break;
      case 'List of products':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListPage(
              titleFontSize: widget.titleFontSize,
              titleFontWeight: widget.titleFontWeight,
            ),
          ),
        );
        break;
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              titleFontSize: widget.titleFontSize,
              titleFontWeight: widget.titleFontWeight,
            ),
          ),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ),
        );

        break;
      // Handle other cases if necessary
    }
  }

  // List of drawer menu items
  final List<Map<String, dynamic>> drawerMenuItems = [
    {'title': 'Add new product', 'icon': Icons.add},
    {'title': 'List of products', 'icon': Icons.list},
    {'title': 'Orders', 'icon': Icons.shopping_cart},
    {'title': 'Recent orders', 'icon': Icons.history},
    {'title': 'Profile', 'icon': Icons.person},
    {'title': 'My Documents', 'icon': Icons.document_scanner},
    {'title': 'Settings', 'icon': Icons.settings},
    {'title': 'Contact us', 'icon': Icons.contact_mail},
    {'title': 'Logout', 'icon': Icons.logout},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text("Hi Vendor name"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 30, 30, 30),
              ),
              child: Text(
                'Hi Vendor name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (var item in drawerMenuItems) ...[
              ListTile(
                leading: Icon(item['icon']),
                title: Text(item['title']),
                onTap: () => _navigateTo(item['title']),
              ),
              if (item['title'] == 'Recent orders' ||
                  item['title'] == 'My Documents') ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
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
                fontSize: widget.titleFontSize,
                fontWeight: widget.titleFontWeight,
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 28, 20, 85),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Optional: round corners
                ),
              ),
              onPressed: _handleAddProduct, // Call the method on button press
              child: const Row(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  titleFontSize: widget.titleFontSize,
                  titleFontWeight: widget.titleFontWeight,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class AddProductPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const AddProductPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _CategoryController = TextEditingController();
  final TextEditingController _SubCategoryController = TextEditingController();

  String? _selectedCategory;
  String? _selectedSubCategory;

  final List<String> categories = ['Machinery', 'Electronics', 'Vehicles'];
  final List<String> subCategories = ['JCB', 'Excavator', 'Bulldozer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text('Add Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 30, 30, 30),
              ),
              child: Text(
                'Hi Vendor name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (var item in drawerMenuItems) ...[
              ListTile(
                leading: Icon(item['icon']),
                title: Text(item['title']),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              if (item['title'] == 'Recent orders' ||
                  item['title'] == 'My Documents') ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add your product",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Machinery',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Sub Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _selectedSubCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSubCategory = newValue;
                });
              },
              items:
                  subCategories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Sub Category',
              ),
            ),
            const Text(
              'Select Category and Select Sub Category',
              style: TextStyle(
                color: Color.fromARGB(255, 156, 152, 152),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 28, 20, 85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDetailsPage(
                          titleFontSize: widget.titleFontSize,
                          titleFontWeight: widget.titleFontWeight,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue & Next',
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
            const Center(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List of drawer menu items

  final List<Map<String, dynamic>> drawerMenuItems = [
    {'title': 'Add new product', 'icon': Icons.add},
    {'title': 'List of products', 'icon': Icons.list},
    {'title': 'Orders', 'icon': Icons.shopping_cart},
    {'title': 'Recent orders', 'icon': Icons.history},
    {'title': 'Profile', 'icon': Icons.person},
    {'title': 'My Documents', 'icon': Icons.document_scanner},
    {'title': 'Settings', 'icon': Icons.settings},
    {'title': 'Contact us', 'icon': Icons.contact_mail},
    {'title': 'Logout', 'icon': Icons.logout},
  ];
}

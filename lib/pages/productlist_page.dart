import 'package:flutter/material.dart';
import 'package:rentalapp/pages/home_page.dart'; // Ensure this import is correct
import 'package:rentalapp/pages/profile_page.dart';

class ProductListPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const ProductListPage({
    Key? key,
    required this.titleFontSize,
    required this.titleFontWeight,
  }) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
  }

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

  final List<Map<String, String>> products = [
    {
      "title": "Product title",
      "price": "00",
      "images": "5 Images",
      "review": "This product review in process"
    },
    {
      "title": "Product title",
      "price": "00",
      "images": "5 Images",
      "review": "This product review in process"
    },
    {
      "title": "Product title",
      "price": "00",
      'availability': "15 July - 30 August",
      "quantity": "2",
      "images": "5 Images",
      "view": "View Product"
    },
  ];

  void _editProduct(int index) {
    // Handle product edit action here
    print('Edit product at index: $index');
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to delete?'),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No, keep it!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Products',
          style: TextStyle(
            fontSize: widget.titleFontSize,
            fontWeight: widget.titleFontWeight,
          ),
        ),
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
              print('Notification icon pressed');
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
                title: Text(
                  item['title'],
                  style:
                      TextStyle(color: Colors.grey), // Set text color to grey
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  // Handle navigation for each item
                  if (item['title'] == 'List of products') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListPage(
                          titleFontSize: widget.titleFontSize,
                          titleFontWeight: widget.titleFontWeight,
                        ),
                      ),
                    );
                  } else if (item['title'] == 'Profile') {
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
                  // Add more conditions as needed
                },
              ),
              if (item['title'] == 'Recent orders' ||
                  item['title'] == 'My Documents') ...[
                Padding(
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: product['title'] == 'Product title' &&
                            product['availability'] != null
                        ? Colors.green[200] // Green color for specific product
                        : Colors.grey[200], // Grey color for others
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['title']!,
                            style: TextStyle(
                              color: product['title'] == 'Product title' &&
                                      product['availability'] != null
                                  ? Colors.green[
                                      800] // Darker green text for specific product
                                  : Colors
                                      .grey[800], // Darker grey text for others
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'edit') {
                                _editProduct(index);
                              } else if (value == 'delete') {
                                _deleteProduct(index);
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return {'Edit', 'Delete'}.map((String choice) {
                                return PopupMenuItem<String>(
                                  value: choice.toLowerCase(),
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price INR. ${product['price']}',
                        style: TextStyle(
                          color: product['title'] == 'Product title' &&
                                  product['availability'] != null
                              ? Colors.green[
                                  600] // Lighter green text for specific product
                              : Colors
                                  .grey[600], // Lighter grey text for others
                        ),
                      ),
                      SizedBox(height: 8),
                      if (product.containsKey('availability'))
                        Text(
                          'Availability ${product['availability']}',
                          style: TextStyle(
                            color: product['title'] == 'Product title' &&
                                    product['availability'] != null
                                ? Colors.green[
                                    600] // Lighter green text for specific product
                                : Colors
                                    .grey[600], // Lighter grey text for others
                          ),
                        ),
                      if (product.containsKey('quantity'))
                        Text(
                          'Quantity ${product['quantity']}',
                          style: TextStyle(
                            color: product['title'] == 'Product title' &&
                                    product['availability'] != null
                                ? Colors.green[
                                    600] // Lighter green text for specific product
                                : Colors
                                    .grey[600], // Lighter grey text for others
                          ),
                        ),
                      SizedBox(height: 8),
                      if (product.containsKey('images'))
                        Text(
                          '${product['images']}',
                          style: TextStyle(
                            color: product['title'] == 'Product title' &&
                                    product['availability'] != null
                                ? Colors.green[
                                    600] // Lighter green text for specific product
                                : Colors
                                    .grey[600], // Lighter grey text for others
                          ),
                        ),
                      SizedBox(height: 8),
                      if (product.containsKey('review'))
                        Text(
                          '${product['review']}',
                          style: TextStyle(
                            color: product['title'] == 'Product title' &&
                                    product['availability'] != null
                                ? Colors.green[
                                    600] // Lighter green text for specific product
                                : Colors
                                    .grey[600], // Lighter grey text for others
                          ),
                        ),
                      SizedBox(height: 8),
                      if (product.containsKey('view'))
                        ElevatedButton(
                          onPressed: () {
                            // Handle view product action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 30, 30,
                                30), // Set button background color to black
                            foregroundColor:
                                Colors.white, // Set button text color to white
                          ),
                          child: Text(product['view']!),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 15, 15, 15),
        onTap: _onItemTapped,
      ),
    );
  }
}

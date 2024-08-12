import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDetailsPage extends StatefulWidget {
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const AddDetailsPage({
    super.key,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  _AddDetailsPageState createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _attachmentsController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _productImagesController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _additionalChargesController =
      TextEditingController();

  String? _selectedSerialNumber;
  String? _selectedPriceType;
  String? _selectedAdditionalServices;

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _productImagesController.text = result.files.single.name;
      });
    }
  }

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
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add new product'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List of products'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Recent orders'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('My Documents'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Your Products',
                style: TextStyle(
                  fontSize: widget.titleFontSize,
                  fontWeight: widget.titleFontWeight,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Category: Machinery',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Text(
                'Sub Category: JCB',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 1.0,
                      color: Color.fromARGB(255, 18, 18, 18),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Product 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Machinery ID/Serial Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _serialNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Model Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _modelNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Machinery year",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedSerialNumber,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSerialNumber = newValue;
                        });
                      },
                      items: <String>['Select', 'Serial1', 'Serial2', 'Serial3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Conditional (optional)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedSerialNumber,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSerialNumber = newValue;
                        });
                      },
                      items: <String>['Select', 'Serial1', 'Serial2', 'Serial3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Additional Attachments",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _attachmentsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Availability",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _availabilityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Product Images",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _productImagesController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.image),
                          onPressed: _pickImage,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Price Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedPriceType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPriceType = newValue;
                        });
                      },
                      items: <String>[
                        'Per Hour',
                        'Per Day',
                        'Per Week',
                        'Per Month'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text(
                      'Price includes the Application platform fee 10%',
                      style: TextStyle(
                        color: Color.fromARGB(255, 84, 82, 82),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "+ Add a New Price Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 4, 100, 179),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Additional Services Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedAdditionalServices,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAdditionalServices = newValue;
                        });
                      },
                      items: <String>['Driver/operator', 'Delivery']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Additional Charges",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextField(
                      controller: _additionalChargesController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "+ Add a new Additional Service",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 4, 100, 179),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            thickness: 2.5,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              "+ Add another JCB",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 4, 100, 179),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 6, 6, 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  // Add your submit logic here
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
                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
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
    );
  }
}

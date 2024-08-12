import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Correct import for file picker

class FilePickerTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String> allowedFileTypes;

  const FilePickerTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.allowedFileTypes,
  }) : super(key: key);

  @override
  _FilePickerTextFieldState createState() => _FilePickerTextFieldState();
}

class _FilePickerTextFieldState extends State<FilePickerTextField> {
  String? selectedFileName;

  void _pickFile() async {
    // Pick file using file_picker package
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedFileTypes,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFileName = result.files.single.name;
        widget.controller.text = selectedFileName!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              selectedFileName != null ? Icons.check_circle : Icons.attach_file,
              color: selectedFileName != null ? Colors.green : Colors.grey,
            ),
            onPressed: _pickFile,
          ),
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

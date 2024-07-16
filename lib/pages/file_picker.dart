import 'package:flutter/material.dart';

class FilePickerTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String> allowedFileTypes;

  FilePickerTextField({
    required this.hintText,
    required this.controller,
    required this.allowedFileTypes,
  });

  @override
  _FilePickerTextFieldState createState() => _FilePickerTextFieldState();
}

class _FilePickerTextFieldState extends State<FilePickerTextField> {
  void _pickFile() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 8),
            TextButton(
              onPressed: _pickFile,
              child: Text('Choose file'),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          'Upload only ${widget.allowedFileTypes.join(" or ")}',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

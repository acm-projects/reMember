import 'package:flutter/material.dart';

class EditContact extends StatefulWidget {
  const EditContact({Key? key}) : super(key: key);
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),
        title: const Text('Create New Contact'),
        centerTitle: true,
      ),
      body: const Text(''),
    );
  }
}
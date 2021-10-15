import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
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



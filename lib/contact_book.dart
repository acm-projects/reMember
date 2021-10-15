import 'package:flutter/material.dart';

class ContactBook extends StatefulWidget {
  const ContactBook({Key? key}) : super(key: key);
  @override
  _ContactBookState createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar: AppBar (
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),
        title: const Text('Contact Book'),
        centerTitle: true,
      ),
      body: const Text(''),
    );
  }
}
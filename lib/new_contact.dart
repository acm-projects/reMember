import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key? key}) : super(key: key);
  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar: AppBar (
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),
        title: const Text('Create New Contact'),
        centerTitle: true,
      ),
      body: const Text(''),
    );
  }
}
import 'package:flutter/material.dart';

class ScanContact extends StatefulWidget {
  const ScanContact({Key? key}) : super(key: key);

  @override
  _ScanContactState createState() => _ScanContactState();
}

class _ScanContactState extends State<ScanContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar: AppBar (
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),
        title: const Text('Scan Contact'),
        centerTitle: true,
      ),
      body: const Text(''),
    );
  }
}

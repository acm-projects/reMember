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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/contactBook');
              },
              icon: const Icon(Icons.book),
              label: const Text('Contact Book'),
            ),
          ],
        ),
      ),
    );
  }
}
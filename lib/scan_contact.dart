import 'package:flutter/material.dart';

class ScanContact extends StatefulWidget {
  const ScanContact({Key key}) : super(key: key);

  @override
  _ScanContactState createState() => _ScanContactState();
}

class _ScanContactState extends State<ScanContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),

      body: Column(
        children: <Widget> [
      const SizedBox(
      height: 60.0,
      ),

      //Back Button
      Align(
        alignment: Alignment.topLeft,
        child: Ink(
            child: IconButton(
              constraints: const BoxConstraints(maxHeight: 70),
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
              iconSize: 20.0,
              onPressed: () {
                Navigator.pushNamed(context, '/contactBook');
              },
            ),
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 34, 34, 59),
              shape: CircleBorder(),

            )),
      )
    ],

    )
    );
  }
}

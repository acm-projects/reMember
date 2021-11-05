import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  const Flashcard({Key? key}) : super(key: key);

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar: AppBar (
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),
        title: const Text(''),
        centerTitle: true,
      ),
      body: const Text(''),
    );
  }
}
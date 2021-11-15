import 'package:remember/widgets/flashcard.dart';
import 'package:remember/widgets/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class Flashcards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Flashcards();
}

class _Flashcards extends State<Flashcards> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "Who is this?",
        answer: "Fanny Dolisy, Aunt",
        img: "https://images.unsplash.com/photo-1589329482108-e414c7c6b8c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80"
        ),
    Flashcard(
        question: "Who is this?",
        answer: "Arrio Gonsalves, Son",
        img: "https://school.canto.com/direct/image/5gvprq2pf10lte88nktrooj46l/o-lE_drSP78JMcAYRxHkMALYY1Y/original?content-type=image%2Fjpeg&name=arrio.jpg"
        ),
    Flashcard(
        question: "Who is this?",
        answer: "Grace Yang, Daughter",
        img: "https://school.canto.com/direct/image/midkahnv1t2op373akff7dng3c/Hp_jWVrSIBHazkAywXXgXqzDOhU/original?content-type=image%2Fjpeg&name=grace.JPG"
        ),

    Flashcard(
        question: "Who is this?",
        answer: "Ahmad Ali, Son-in-law",
        img: "https://school.canto.com/direct/image/vbj6rmu7vl50pfm1ruqmg4fr3n/CevyuHAptgkWfsw5tc4C0Fk24Cg/original?content-type=image%2Fjpeg&name=ali.jpg"
        ),
    Flashcard(
        question: "Who is this?",
        answer: "Shagun Dalal, Niece",
        img: "https://school.canto.com/direct/image/5mcvd5n09d7bfcaamun1ub8a7r/s5iTEH4-2mPWfWZeb_dUnC7CR8g/original?content-type=image%2Fjpeg&name=shagun.JPG"
        ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 232, 214, 203),
          body: Center(
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 350,
                      height: 350,
                      child: FlipCard(
                          front: FlashcardView(
                            text: _flashcards[_currentIndex].question,
                          ),
                          back: FlashcardView(
                            text: _flashcards[_currentIndex].answer,
                          ))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(maxHeight: 70),
                          icon: const Icon(Icons.arrow_back_rounded),
                          color: Color.fromARGB(255, 34, 34, 59),
                          iconSize: 70.0,
                          onPressed: showPreviousCard,
                        ),
                        IconButton(
                          constraints: const BoxConstraints(maxHeight: 70),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Color.fromARGB(255, 34, 34, 59),
                          iconSize: 70.0,
                          onPressed: showNextCard,
                        ),

                      ]),
                ]),
          ),
        ));
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
      (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
      (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
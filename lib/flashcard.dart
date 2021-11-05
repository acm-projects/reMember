import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  const Flashcard({Key key}) : super(key: key);

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),

        child: Column(
          children: <Widget>[
        //Spacing
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
                  Navigator.pushNamed(context, '/home');
                },
              ),
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 34, 34, 59),
                shape: CircleBorder(),

              )),

        ),

            //const SizedBox(
             // height: 15.0,
            //),

            Align(
              alignment: Alignment.topCenter,
              child: Ink(
                  child: IconButton(
                    constraints: const BoxConstraints(maxHeight: 70),
                    icon: const Icon(Icons.arrow_upward_rounded),
                    color: Color.fromARGB(255, 34, 34, 59),
                    iconSize: 70.0,
                    onPressed: () {
                      //Navigator.pushNamed(context, '/home');
                    },
                  )
                  )),

        //Spacing
        const SizedBox(
          height: 30.0,
        ),



            Container(
                height: 450.0,
                width: 300.0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 75, 78, 105),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                      child: RotatedBox(
                        quarterTurns: 3,
                      child: Text('Who is this?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    )
                    )
                  ),
            ),


            const SizedBox(
              height: 15.0,
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child: Ink(
                    child: IconButton(
                      constraints: const BoxConstraints(maxHeight: 70),
                      icon: const Icon(Icons.arrow_downward_rounded),
                      color: Color.fromARGB(255, 34, 34, 59),
                      iconSize: 70.0,
                      onPressed: () {
                        //Navigator.pushNamed(context, '/home');
                      },
                    )
                )),

      ],
    ),
    )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:remember/flashcards.dart';
import 'package:remember/widgets/flashcard.dart';
import 'package:remember/widgets/listview_widget.dart';
import 'package:remember/widgets/users_provider.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({Key key, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color.fromARGB(255, 74, 78, 105),
      child: Center(
        child: Container(
          child: Column(
              children: [
                Container(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    )
                  ),
                Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage("https://school.canto.com/direct/image/5gvprq2pf10lte88nktrooj46l/o-lE_drSP78JMcAYRxHkMALYY1Y/original?content-type=image%2Fjpeg&name=arrio.jpg"),

                  ),

                ),
                ],
          ),



        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 180.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('reMember',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 59),
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
            //const SizedBox(
              //height: 15.0,
            //),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/contactBook');
              },
              label: const Text(''),
              icon: const Icon(Icons.menu_book,
                size: 60.0,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                side: const BorderSide(width: 3.0, color: Colors.white),
                primary: const Color.fromARGB(255, 173, 106, 108),
                fixedSize: const Size(375, 125),
              ),
            ),
            const SizedBox(
              height: 40.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Contact Book',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 59),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/scanContact');
              },
              label: const Text(''),
              icon: const Icon(Icons.add_a_photo_outlined,
                size: 60.0,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                side: const BorderSide(width: 3.0, color: Colors.white),
                primary: const Color.fromARGB(255, 93, 46, 70),
                fixedSize: const Size(325, 130),
              ),
            ),
            const SizedBox(
              height: 40.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Scan Contact',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 59),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/flashcard');
              },
              label: const Text(''),
              icon: const Icon(Icons.event_note_rounded,
                size: 60,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                side: const BorderSide(width: 3.0, color: Colors.white),
                primary: const Color.fromARGB(255, 74, 78, 105),
                fixedSize: const Size(325, 130),
              ),
            ),
            const SizedBox(
              height: 40.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Flashcards',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 59),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            )],
        ),
      ),
    );
  }
}
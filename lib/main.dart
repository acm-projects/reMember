import 'package:flutter/material.dart';
//import 'package:remember/loading.dart';
import 'package:remember/home.dart';
import 'package:remember/contact_book.dart';
import 'package:remember/contact_info.dart';
import 'package:remember/loading.dart';
import 'package:remember/edit_contact.dart';
import 'package:remember/new_contact.dart';
import 'package:remember/scan_contact.dart';
import 'package:remember/flashcards.dart'; // change it flashcards eventually

void main() => runApp(MaterialApp(
  initialRoute: '/home', //change route to '/' when done with app so that loading screen works
  home: Loading(),
  routes: {
    '/loading': (context) => Loading(),
    '/home': (context) => Home(),
    '/contactBook': (context) => const ContactBook(),
    '/scanContact': (context) => const ScanContact(),
    '/flashcard': (context) => Flashcards(),
    '/newContact': (context) => const NewContact(),
    '/contactInfo': (context) => const ContactInfo(),
    '/editContact': (context) => const EditContact(),
  },
));

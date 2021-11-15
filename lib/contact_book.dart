import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember/widgets/users_provider.dart';
import 'package:remember/widgets/listview_widget.dart';
import 'package:provider/provider.dart';


class ContactBook extends StatefulWidget {
  const ContactBook({Key key}) : super(key: key);
  @override
  _ContactBookState createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  int number = 1;

  //trying to get names and relations from firebase
  final databaseRef = FirebaseDatabase.instance.reference(); //database reference object
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  String name = "";
  String relation = "";
  String id = "";


  //creates contact book from tutorial
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => UsersProvider(),
    child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 214, 203),
      appBar:
      AppBar(
        toolbarHeight: 180,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 232, 214, 203),
        flexibleSpace: Container(
          color: Color.fromARGB(255, 232, 214, 203),
          child: Column(
            children: [
              Container(

                height: 70,
                color: Color.fromARGB(255, 232, 214, 203),

              ),
              Align(
                alignment: Alignment.center,
                child: Text('Contact Book',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 59),
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              Container(
                height: 20.0,
              ),
              Container(
                  height: 40.0,
                  width: 300.0,
                  color: const Color.fromARGB(255, 232, 214, 203),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child:  TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Enter a search term',
                      ),
                    ),
                  )),
            ],
          ),
        ),
        leading: Container(

          child: Row(
              children: <Widget> [
                //Back Button
                SizedBox(
                  width: 20,
                ),
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


              ]
          ),
        ),


        actions: [
          Align(
            alignment: Alignment.topRight,
            child: Ink(
                child: IconButton(
                  constraints: const BoxConstraints(maxHeight: 70),
                  icon: const Icon(Icons.person_add_alt_1_rounded),
                  color: Colors.white,
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/newContact');
                    setState(() {
                      number = number + 1;
                    });
                  },
                ),
                decoration: const ShapeDecoration(
                  color: Color.fromARGB(255, 34, 34, 59),
                  shape: CircleBorder(),

                )),
          ),

          SizedBox(
            width: 20,
          ),

        ],
      ),



      body: Consumer<UsersProvider>(
        builder: (context, usersProvider, _) => ListViewWidget(
          usersProvider: usersProvider,
        ),
      ),
    ),
  );
}
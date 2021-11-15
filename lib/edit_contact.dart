import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';


class EditContact extends StatefulWidget {
  const EditContact({Key, key}) : super(key: key);
  @override
  _EditContactState createState() => _EditContactState();
}


void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 93, 46, 70),
        content: new Text("Are you sure you want to delete this contact?",
          style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          new TextButton(
            child: new Text("Cancel",
              style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          SizedBox(
            width: 100,
          ),

          new TextButton(
            child: new Text("Delete",
              style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
              textAlign: TextAlign.left,
            ),
            //DELETE HERE!!!!
            onPressed: () {
              Navigator.of(context).pop();

            },
          ),
        ],
      );
    },
  );
}



class _EditContactState extends State<EditContact> {

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  //trying to get document id from the name of the tile from firebase
  final databaseRef = FirebaseDatabase.instance.reference(); //database reference object
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');
  String nameOnTile = "Arrio Gonsalves"; //need to somehow get name from the tile clicked on
  var _contactId;
  String name = "";
  String age = "";
  String gender = "";
  String phoneNum = "";
  String email = "";
  String relation = "";
  String description = "";


  //FirebaseFirestore.instance.collection('contacts').doc(_contactId).update({'age': 'Some new data'});

  Future<void> addContact(String name, String age, String gender, String phoneNum, String email, String relation, String description) {
    // Call the user's CollectionReference to add a new user
    print("in add contact");
    return contacts
        .add({
      'name': name,
      'age': age,
      'gender': gender,
      'phoneNum': phoneNum,
      'email': email,
      'relation': relation,
      'description': description
    })
        .then((value) => print("Contact Added"))
        .catchError((error) => print("Failed to add contact: $error"));
  }

  //edits the name DOESNT RLY WORK
  /*Future<void> editName(var n, var val)
  {
    //await getId();
    var collection = FirebaseFirestore.instance.collection('contacts');
    collection
        .doc('CB7a2vm2N4F1XX4MTuYX')
        .update({n : val}) // <-- Updated data
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));
  }*/

  //pretty sure it is storing it in _contactId
  Future<DocumentSnapshot> getId() async {
    //print("in get id");
    String contactId = "original";
    await FirebaseFirestore.instance
        .collection('contacts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["name"] == nameOnTile)
        {
          contactId = doc.reference.id;
          setState(() => _contactId = contactId);
          //print(contactId);
          //print(_contactId);
        }
      });
    });
  }

  Future<DocumentSnapshot> getInfo() async {
    await Firebase.initializeApp();
    await getId();
    //print("in get info");
    //print(_contactId);
    return await FirebaseFirestore.instance
        .collection("contacts")
        .doc(_contactId)
        .get();
  }

  //DELETE FUNCTION
  Future del(snapshot) async {
    await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
      await getId();
      print("in delete function");
      await myTransaction.delete(snapshot.data.documents[_contactId].reference);
    });
  }



  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: getInfo(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 232, 214, 203),
            body: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Stack(
                children: <Widget>[
                  //Spacing
                  Column(
                    children: <Widget>[
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

                      ),


                      //delete button
                      SizedBox(
                        width: 146.7,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          _showDialog(context);
                          print("about to delete");
                          final collection = FirebaseFirestore.instance.collection('contacts');
                          collection
                              .doc(_contactId)
                              .delete()
                              .then((_) => print('Deleted'))
                              .catchError((error) => print('Delete failed: $error'));
                          Navigator.pushNamed(context, '/contactBook');
                        },
                        child: const Center(
                          child: Text("Delete",
                              style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
                              textAlign: TextAlign.left),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          primary: const Color.fromARGB(255, 173, 106, 108),
                          fixedSize: const Size(150, 40),
                        ),
                      ),






                      //Title
                      const SizedBox(
                        height: 45.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Contact Info',
                            style: TextStyle(
                              color: Color.fromARGB(255, 34, 34, 59),
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ),


                      //Spacing
                      const SizedBox(
                        height: 10.0,
                      ),


                      //Profile
                      Container(
                          height: 50.0,
                          width: 400.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(0)),
                            ),
                            padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                            child: TextFormField(
                              initialValue: ("${snapshot.data.data()['name']}"),
                              onChanged: (value) => name = value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 234, 233, 233),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(
                                      255, 234, 233, 233), width: 2.5),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      30.0)),
                                ),
                                hintStyle: TextStyle(color: Color.fromARGB(255,
                                    167, 160, 160),
                                    height: 1.0,
                                    fontSize: 16,
                                    fontFamily: "Quicksand"),
                                hintText: 'name',
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                      ),




                      Container(
                          height: 45.0,
                          width: 400.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(0))),
                            padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: TextFormField(
                                    initialValue: ("${snapshot.data.data()['age']}"),
                                    //changed onChanged to onSaved
                                    onChanged: (value) => age = value,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(
                                          255, 234, 233, 233),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 234, 233, 233), width: 2.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                      ),
                                      hintStyle: TextStyle(color: Color.fromARGB(
                                          255, 167, 160, 160),
                                          height: 1.0,
                                          fontSize: 16,
                                          fontFamily: "Quicksand"),
                                      hintText: 'Age',
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),


                                Flexible(
                                  child: TextFormField(
                                      initialValue: ("${snapshot.data.data()['gender']}"),
                                      onChanged: (value) => gender = value,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color.fromARGB(
                                            255, 234, 233, 233),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 234, 233, 233),
                                              width: 2.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 167, 160, 160),
                                            height: 1.0,
                                            fontSize: 16,
                                            fontFamily: "Quicksand"),
                                        hintText: 'Gender',
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),

                                      )
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                      ,

                      Container(
                          height: 45.0,
                          width: 400.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(0))),
                            padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                            child: TextFormField(
                              initialValue: ("${snapshot.data.data()['phoneNum']}"),
                              onChanged: (value) => phoneNum = value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 234, 233, 233),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(
                                      255, 234, 233, 233), width: 2.5),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      30.0)),
                                ),
                                hintStyle: TextStyle(color: Color.fromARGB(255,
                                    167, 160, 160),
                                    height: 1.0,
                                    fontSize: 16,
                                    fontFamily: "Quicksand"),
                                hintText: 'Phone Number',
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                      ),

                      Container(
                          height: 65.0,
                          width: 400.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(30)),
                            ),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),


                            child: TextFormField(
                              initialValue: ("${snapshot.data.data()['email']}"),
                              onChanged: (value) => email = value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 234, 233, 233),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(
                                      255, 234, 233, 233), width: 2.5),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      30.0)),
                                ),
                                hintStyle: TextStyle(color: Color.fromARGB(255,
                                    167, 160, 160),
                                    height: 1.0,
                                    fontSize: 16,
                                    fontFamily: "Quicksand"),
                                hintText: 'Email address',
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              textAlign: TextAlign.left,
                            ),


                          )
                      ),
                      //],
                      //)

                      //Spacing
                      const SizedBox(
                        height: 10.0,
                      ),


                      //Relation and Description
                      Container(
                        height: 70.0,
                        width: 400.0,
                        color: const Color.fromARGB(255, 232, 214, 203),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 173, 106, 108),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(0)),
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text("Relation",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: "Quicksand"),
                                textAlign: TextAlign.left
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 40.0,
                        width: 400.0,
                        color: const Color.fromARGB(255, 232, 214, 203),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 173, 106, 108),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(0.0))),
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextFormField(
                              initialValue: ("${snapshot.data.data()['relation']}"),
                              onChanged: (value) => relation = value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 234, 233, 233),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 234, 233, 233),
                                      width: 2.5),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30.0)),
                                ),
                                hintStyle: TextStyle(color: Color.fromARGB(
                                    255, 167, 160, 160),
                                    height: 1.0,
                                    fontSize: 16,
                                    fontFamily: "Quicksand"),
                                hintText: 'Edit Text',
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),


                      Container(
                        height: 60.0,
                        width: 400.0,
                        color: const Color.fromARGB(255, 232, 214, 203),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 173, 106, 108),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(0)),
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text("Description",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: "Quicksand"),
                                textAlign: TextAlign.left
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 155.0,
                        width: 400.0,
                        color: const Color.fromARGB(255, 232, 214, 203),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 173, 106, 108),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(30)),
                          ),
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                            child: Expanded(
                              child: TextFormField(
                                  initialValue: ("${snapshot.data.data()['description']}"),
                                  onChanged: (value) => description = value,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  autofocus: true,
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 234, 233, 233),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 233, 233), width: 2.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 167, 160, 160),
                                        height: 7.0,
                                        fontSize: 16,
                                        fontFamily: "Quicksand"),
                                    hintText: 'Edit Text',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Spacing
                      const SizedBox(
                        height: 10.0,
                      ),


                      //Save Contact Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contactBook');
                          addContact(name, age, gender, phoneNum, email, relation, description);
                          //delete contact
                          final collection = FirebaseFirestore.instance.collection('contacts');
                          print('should print contact id');
                          print(_contactId);
                          collection
                              .doc(_contactId)
                              .delete()
                              .then((_) => print('Deleted'))
                              .catchError((error) => print('Delete failed: $error'));
                        },
                        child: const Center(
                          child: Text("Save Contact",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Quicksand"),
                              textAlign: TextAlign.left),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          primary: const Color.fromARGB(255, 34, 34, 59),
                          fixedSize: const Size(400, 50),
                        ),
                      ),

                    ],
                  ),
                  Positioned(
                    top: 180,
                    left: 15,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 173, 106, 108),
                        radius: 50.0,
                        child: Text("",
                          style: TextStyle(color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Quicksand"),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 172,
                    left: 7.5,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/contactBook');
                        },
                        icon: const Icon(Icons.account_circle_rounded,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            )
        );


      } else {
        // We can show the loading view until the data comes back.
        return CircularProgressIndicator();
      }
    },
  );
}
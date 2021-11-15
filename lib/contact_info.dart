import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';


class ContactInfo extends StatefulWidget {
  const ContactInfo({Key, key}) : super(key: key);
  @override
  _ContactInfoState createState() => _ContactInfoState();
}


class _ContactInfoState extends State<ContactInfo> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  //trying to get document id from the name of the tile from firebase
  final databaseRef = FirebaseDatabase.instance.reference(); //database reference object
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  String nameOnTile = "Arrio Gonsalves"; //need to somehow get name from the tile clicked on
  String relation = "";
  var _contactId;
  String image = "https://school.canto.com/direct/image/5gvprq2pf10lte88nktrooj46l/o-lE_drSP78JMcAYRxHkMALYY1Y/original?content-type=image%2Fjpeg&name=arrio.jpg";

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

  _fetchData() {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      getInfo();
      return "DID IT WORK";
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

              Row(
                children: <Widget>[
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


                      SizedBox(
                        width: 260,
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: Ink(
                            child: IconButton(
                              constraints: const BoxConstraints(maxHeight: 70),
                              icon: const Icon(Icons.edit_outlined),
                              color: Colors.white,
                              iconSize: 20.0,
                              onPressed: () {
                                Navigator.pushNamed(context, '/editContact');
                              },
                            ),
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 34, 34, 59),
                              shape: CircleBorder(),

                            )),
                      ),

                   ]),




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


                      //TEST CODE FOR RETRIEVING DATA
                      /*Container(
                        height: 50.0,
                        width: 400.0,
                            child: Container(
                              child: Text("${snapshot.data.data()['relation']}"),//Text(_contactId),
                            )
                    ),*/




                      //future builder


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
                              enabled: false,
                              initialValue: ("${snapshot.data.data()['name']}"),
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
                                    enabled: false,
                                    initialValue: ("${snapshot.data.data()['age']}"),
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
                                  child: SizedBox(
                                    width: 1,
                                  )

                                ),

                                Flexible(
                                  child: TextFormField(
                                      enabled: false,
                                      initialValue: ("${snapshot.data.data()['gender']}"),
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
                              enabled: false,
                              initialValue: ("${snapshot.data.data()['phoneNum']}"),
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
                              enabled: false,
                              initialValue: ("${snapshot.data.data()['email']}"),
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
                              enabled: false,
                              initialValue: ("${snapshot.data.data()['relation']}"),
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
                                  enabled: false,
                                  initialValue: ("${snapshot.data.data()['description']}"),
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
                      /*ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contactBook');
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
                        ),*/

                    ],
                  ),
                  Positioned(
                    top: 180,
                    left: 15,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 173, 106, 108),
                        radius: 50.0,
                        backgroundImage: NetworkImage(image),
                        child: Text("",
                          style: TextStyle(color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Quicksand"),
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
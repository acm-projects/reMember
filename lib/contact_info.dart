import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
    //late String description;
    @override
    Widget build(BuildContext context){
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


                    //Title
                    const SizedBox(
                      height: 45.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Create Contact',
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
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
                              hintText: 'Name',
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
                              borderRadius: BorderRadius.all(Radius.circular(0))),
                          padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
                                    hintText: 'Age',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),


                              Flexible(
                                child: TextField(
                                    decoration: InputDecoration(
                                      filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
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
                              borderRadius: BorderRadius.all(Radius.circular(0))),
                          padding: const EdgeInsets.fromLTRB(130, 10, 30, 0),
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
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
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
                              hintText: 'Email Address',
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
                              style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Quicksand"),
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
                            borderRadius: BorderRadius.all(Radius.circular(0.0))),
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: const TextField(
                            decoration: InputDecoration(
                              filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 1.0, fontSize: 16, fontFamily: "Quicksand"),
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
                              style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Quicksand"),
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
                        child: const Center(
                          child: Expanded(
                            child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                autofocus: true,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  filled: true, fillColor: Color.fromARGB(255, 234, 233, 233),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 234, 233, 233), width: 2.5),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 167, 160, 160), height: 7.0, fontSize: 16, fontFamily: "Quicksand"),
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
                      },
                      child: const Center(
                        child: Text("Save Contact",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
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
                        style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Quicksand"),
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
  }
}



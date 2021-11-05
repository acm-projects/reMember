import 'package:flutter/material.dart';

class ContactBook extends StatefulWidget {
  const ContactBook({Key key}) : super(key: key);
  @override
  _ContactBookState createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 214, 203),

        body: SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                      children: <Widget> [
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
                        SizedBox(
                          width: 320,
                        ),
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
                      ]
                  ),
                ),
                Container(
                  height: 60,
                  child: Column(
                    children: const <Widget>[
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
                    ],
                  ),
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

                SizedBox(
                  height: 20,
                ),

                ListView.builder(
                  physics: ScrollPhysics(parent: null),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,
                      int index){
                    return Container(
                        color: index.isEven? Color.fromARGB(255, 74, 78, 105) : Color.fromARGB(255, 154, 134, 152),
                        child: ListTile(
                          onTap: () => Navigator.pushNamed(context, '/newContact'),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          leading: Icon(Icons.date_range),
                          title: Text ('Kim Huang'),
                          subtitle: Text('Daughter'),
                        )
                    );
                  }, itemCount: number,
                ),

              ]),
        ),
      ),
    );

  }
}

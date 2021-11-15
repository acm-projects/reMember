import 'package:remember/widgets/users_provider.dart';
import 'package:flutter/material.dart';

String _contactName = "original contact name";

//trying to get _contactName to send to other pages
/*class gettingCN {
  final String contactName;
  const gettingCN(this.contactName);
}*/

class ListViewWidget extends StatefulWidget {
  final UsersProvider usersProvider;

  const ListViewWidget({
    @required this.usersProvider,
    Key key,
  }) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(scrollListener);
    widget.usersProvider.fetchNextUsers();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
        scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      if (widget.usersProvider.hasNext) {
        widget.usersProvider.fetchNextUsers();
      }
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
    controller: scrollController,
    padding: EdgeInsets.all(12),
    children: [
      ...widget.usersProvider.users
          .map((user) => Card(
          color: Color.fromARGB(255, 232, 214, 203),
          elevation: 0.0,
          child: ListTile(
        onTap: () {
          _contactName = user.name;
          print("About to print contact name");
          print(_contactName);
          Navigator.pushNamed(context, '/contactInfo');
        },
        //onTap: () => Navigator.pushNamed(context, '/contactInfo'),
        //TRYING TO GET USER's NAME
        //_contactName = Text(user.name);
        //onPressed: (value) => _contactName = value,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        tileColor: Color.fromARGB(255, 173, 106, 108),
        title: Text(user.name,
          style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Quicksand"),
        ),
        subtitle: Text(user.relation,
          style: TextStyle(color: Color.fromARGB(200, 255, 255, 255), fontSize: 16, fontFamily: "Quicksand"),
        ),
        //user image
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.img),
        ),
      )))
          .toList(),
      if (widget.usersProvider.hasNext)
        Center(
          child: GestureDetector(
            onTap: widget.usersProvider.fetchNextUsers,
            child: Container(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
    ],
  );
}
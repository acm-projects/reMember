import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember/widgets/data.dart';

class FirebaseApi {
  static Future uploadUsers() async {
    final currentUsers = await getUsers(1);

    if (currentUsers.docs.isEmpty) {
      final refUsers = FirebaseFirestore.instance.collection('contacts');

      for (final user in List.of(users)) {
        await refUsers.add(user);
      }
    }
  }

  static Future<QuerySnapshot> getUsers(
      int limit, {
        DocumentSnapshot startAfter,
      }) async {
    final refUsers = FirebaseFirestore.instance
        .collection('contacts')
        //.orderBy('rank')
        .limit(limit);

    //print('in get user');

    if (startAfter == null) {
      return refUsers.get();
    } else {
      return refUsers.startAfterDocument(startAfter).get();
    }
  }
}
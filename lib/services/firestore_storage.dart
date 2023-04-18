import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/entry.dart';

class FirestoreStorage {
  static const _leaderboard = 'leaderboard';
  static const _user = 'user';
  static const _time = 'time';

  final db = FirebaseFirestore.instance;

  Future<List<Entry>> getEntries() async {
    List<Entry>entriesList = <Entry>[];
    final event = await db.collection(_leaderboard).get();

    for (var doc in event.docs) {
      Entry newEntry = Entry(
        user: doc.data()[_user],
        time: doc.data()[_time],
      );
      entriesList.add(newEntry);
    }
    return entriesList;
  }

  Future<Entry> insertEntry(String user, int time) async {
    //TODO - Create conditional code that only inserts if time < slowest time + removes slowest time if yes
    final insertedEntry = <String, dynamic>{
      'user': user,
      'time': time
    };
    // insert the given task
    var doc = await db.collection(_leaderboard).add(insertedEntry);
    Entry newEntry = Entry(user: user, time: time);
    return newEntry;
  }
}

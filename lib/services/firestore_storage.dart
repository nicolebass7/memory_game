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
        id: doc.id
      );
      entriesList.add(newEntry);
    }
    // sort the list
    entriesList.sort((a, b) => a.time.compareTo(b.time));

    return entriesList;
  }

  Future<void> insertEntry(String user, int time) async {
    // Create new Entry with the data
    final insertedEntry = <String, dynamic> {
      'user' : user,
      'time' : time
    };

    // Pull the list from the database. Sort the list. Compare newEntry.time with the slowest time
    List<Entry> entryList = await getEntries();
    if (time < entryList.last.time) {
      db.collection(_leaderboard).doc(entryList.last.id).delete();
      db.collection(_leaderboard).add(insertedEntry);
    }
  }
}

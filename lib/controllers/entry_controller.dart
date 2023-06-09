import 'package:memory_game/models/entry.dart';
import 'package:memory_game/services/firestore_storage.dart';

class EntryController {
  factory EntryController() => _singleton;

  EntryController._internal();

  static final EntryController _singleton = EntryController._internal();

  Future<List<Entry>> getEntries() {
    return FirestoreStorage().getEntries();
  }

  Future<void> addEntry(String user, int time) {
    return FirestoreStorage().insertEntry(user, time);
  }
}

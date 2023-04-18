
class Entry {
  Entry({this.user = '', required this.time, required this.id});
  final String user;
  final int time;
  final String id;

  Map<String, dynamic> toMap() {
    return {
      'user' : user,
      'time' : time
    };
  }
}

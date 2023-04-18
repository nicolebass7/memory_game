
class Entry {
  Entry({this.user = '', required this.time});

  final String user;
  final int time;

  Map<String, dynamic> toMap() {
    return {
      'user' : user,
      'time' : time
    };
  }
}

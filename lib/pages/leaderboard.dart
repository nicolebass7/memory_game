import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/entry_controller.dart';
import '../models/entry.dart';


class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final Future<List<Entry>> _entriesFuture = EntryController().getEntries();
  List<Entry>? _entries;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Entry>>(
        future: _entriesFuture,
        builder: (context, snapshot) {
          if (_entries == null && snapshot.hasData) {
            _entries = snapshot.data;
          }
          if (_entries == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('MatchWiz')),
              body: const CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.leaderboard)
            ),
            body: ListView(
              children: [
                //The top of screen message describing the leaderboard
                Text(
                  //style: Theme.of(context).textTheme.displayMedium,
                  AppLocalizations.of(context)!.leadermessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height:10),
                // Header to show user : Time
                Text(
                    AppLocalizations.of(context)!.userheader,
                    textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 25,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                ..._entries!.asMap().entries.map((entry) => _toWidget(entry.key)),
              ],
            ),
          );
        });
  }
  Widget _toWidget(int index) {
    int time = _entries?.elementAt(index).time ?? 0;
    int seconds = time % 60;
    int minutes = ((time - seconds) / 60).truncate();
    return ListTile(
      title: Text(
        "${index+1}: ${_entries?.elementAt(index).user ?? 'Empty'} : $minutes:$seconds",
        textAlign: TextAlign.center,
      ),
    );
  }
}
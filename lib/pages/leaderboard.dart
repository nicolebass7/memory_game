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
    print(_entries?.length);
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
          print('a');
          return Scaffold(
            appBar: AppBar(
                title: const Text('Leaderboard')
            ),
            body: ListView(
              children: [
                //The top of screen message describing the leaderboard
                Text(
                  //style: Theme.of(context).textTheme.displayMedium,
                  AppLocalizations.of(context)!.leadermessage,
                ),
                const SizedBox(height:80),
                // Header to show user : Time
                Text(
                    AppLocalizations.of(context)!.userheader,
                ),
                ..._entries!.asMap().entries.map((entry) => _toWidget(entry.key)),
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: ListView.separated(
                //       itemBuilder: (_, index) => _toWidget(index),
                //       separatorBuilder: (_, __) => const Divider(),
                //       itemCount: _entries!.length,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        });
  }
  Widget _toWidget(int index) {
    print('b');
    return ListTile(
      title: Text("${_entries?.elementAt(index).user ?? 'Empty'} : ${_entries?.elementAt(index).time.toString() ?? ' '}"),
    );
  }
}
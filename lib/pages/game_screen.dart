import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/controllers/entry_controller.dart';
import 'info_card.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int addSeconds = 0;
  int addMinutes = 0;
  late Timer timer;

  void addMinute() {
    setState(() {
      if(addSeconds >= 60){
        addMinutes++;
      }
    });
  }

  void addSecond() {
    setState(() {
      if(addSeconds >= 60) {
        addSeconds / 60;
        addSeconds = 0;
      } else{
        addSeconds++;
      }

    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 0, seconds: 1), (timer) {
      addSecond();
      addMinute();
    });
  }

  TextStyle whiteText = const TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  @override
  void initState() {
    super.initState();
    _game.initGame();
    _game.card_list.shuffle();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final shownMinutes = '$addMinutes';
    final shownSeconds = '$addSeconds';

    return Scaffold(
      backgroundColor: const Color(0xFFE55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Memory Game",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          Center(
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      print(_game.card_list[index]);
                      setState(() {
                        _game.gameImg![index] = _game.card_list[index];
                        _game.matchCheck.add({index: _game.card_list[index]});
                      });

                      if (_game.matchCheck.length == 2) {
                        if (_game.matchCheck[0].values.first ==
                            _game.matchCheck[1].values.first) {
                          print("true");

                          _game.matchCheck.clear();
                          if (!_game.gameImg!.any((img) => img == Game.cardPath)) {
                            // stop
                            timer.cancel();
                            // push to the database
                            await EntryController().addEntry(FirebaseAuth.instance.currentUser!.displayName!,(addSeconds + addMinutes * 60));
                            Navigator.pop(context);
                          }
                        } else {
                          print(false);
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              _game.gameImg![_game.matchCheck[0].keys.first] =
                                  Game.cardPath;
                              _game.gameImg![_game.matchCheck[1].keys.first] =
                                  Game.cardPath;

                              _game.matchCheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB46A),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(_game.gameImg![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),

          Center(
            child: Text(
              "$shownMinutes:$shownSeconds",
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flipcard/homepage.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/pages/game_screen.dart';
import 'package:memory_game/pages/info_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: GameScreen(),
    );
  }
}

// class GameScreen extends StatefulWidget {
//   const GameScreen({Key? key}) : super(key: key);
//
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   int addSeconds = 0;
//   late Timer timer;
//   void addSecond() {
//     setState(() {
//       addSeconds++;
//     });
//   }
//
//   void startTimer() {
//      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//        print('tick');
//       addSecond();
//     });
//   }
//
//   TextStyle whiteText = const TextStyle(color: Colors.white);
//   bool hideTest = false;
//   Game _game = Game();
//
//   @override
//   void initState() {
//     super.initState();
//     _game.initGame();
//     startTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final shownMinutes = '0';
//     final shownSeconds = '$addSeconds';
//
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFE55870),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Center(
//             child: Text(
//               "Memory Game",
//               style: TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//           ),
//
//           // SizedBox(
//           //height: 800,
//           //width: 800,
//           // height: MediaQuery.of(context).size.width,
//           //width: MediaQuery.of(context).size.width,
//
//           Center(
//             child: GridView.builder(
//                 itemCount: _game.gameImg!.length,
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                 ),
//                 padding: const EdgeInsets.all(16.0),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       print(_game.card_list[index]);
//                       setState(() {
//                         _game.gameImg![index] = _game.card_list[index];
//                         _game.matchCheck.add({index: _game.card_list[index]});
//                       });
//
//                       if (_game.matchCheck.length == 2) {
//                         if (_game.matchCheck[0].values.first ==
//                             _game.matchCheck[1].values.first) {
//                           print("true");
//
//                           _game.matchCheck.clear();
//                           if (!_game.gameImg!.any((img) => img == Game.cardPath)) {
//                             // stop
//                                     timer.cancel();
//                           }
//                         } else {
//                           print(false);
//                           Future.delayed(const Duration(milliseconds: 500), () {
//                             setState(() {
//                               _game.gameImg![_game.matchCheck[0].keys.first] =
//                                   Game.cardPath;
//                               _game.gameImg![_game.matchCheck[1].keys.first] =
//                                   Game.cardPath;
//
//                               _game.matchCheck.clear();
//                             });
//                           });
//                         }
//                       }
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(16.0),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFFB46A),
//                         borderRadius: BorderRadius.circular(8.0),
//                         image: DecorationImage(
//                           image: AssetImage(_game.gameImg![index]),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//
//           Center(
//             child: Text(
//               "$shownMinutes:$shownSeconds",
//               style: const TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

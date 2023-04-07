import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MatchWiz")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: Theme.of(context).textTheme.displayMedium,
              /*style: TextStyle(
                fontSize: 60,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
                fontWeight: FontWeight.bold,
              ),*/
              "MatchWiz!",

            ),
            const SizedBox(height:30),
            Text(
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
                "Race to match each pair of pictures and labels."
                    "\nAre you a Match Wiz?"
            ),
            const SizedBox(height:70),
            SizedBox(
                height: 100,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {playGame();},
                    child: const Text(
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        "Play!")
                )
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {loadLeaderboard();},
                  child: const Text(
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      "Leaderboard")
              ),

            ),
            const SizedBox(height: 90),
            OutlinedButton(
              onPressed: () {return;},
              child: const Text("Sign out"),
            )
          ],
        ),
      )
    );
  }

void playGame() {

}
void loadLeaderboard() {

}
  
}
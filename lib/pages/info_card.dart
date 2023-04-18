
import 'dart:math';

class Game{
  static const  String cardPath = 'assets/images/hidden.jpg';
  List<String>? gameImg;

    final int cardCount = 12;
  final List<String> card_list = [
    "assets/images/fox.jpg",
    "assets/images/chick.jpg",
    "assets/images/cat.jpg",
    "assets/images/fox.jpg",
    "assets/images/chick.jpg",
    "assets/images/cat.jpg",
     "assets/images/puppy.jpg",
     "assets/images/panda.jpg",
     "assets/images/puppy.jpg",
     "assets/images/panda.jpg",
     "assets/images/butterfly.jpg",
    "assets/images/butterfly.jpg",
  ];


  List<Map<int, String>> matchCheck = [];


  void initGame(){
    gameImg = List.generate(cardCount, (index) => cardPath);
    }

    List shuffle(List array) {
    var random = Random();

    for(var i = array.length -1; i >0; i--){

      var n =random.nextInt(i+1);
      var temp = array[i];
      array[i]= array[n];
      array[n] = temp;
    }
    return array;
    }
}
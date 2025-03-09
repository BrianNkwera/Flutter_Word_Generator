import 'package:flutter/foundation.dart';
import 'package:english_words/english_words.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random(); // Generate a new random word pair
    notifyListeners(); // Notify listeners to update the UI
  }


  void toggleFavorite() {
    favorites.contains(current)
        ? favorites.remove(current)
        : favorites.add(current);

    notifyListeners();
  }
}

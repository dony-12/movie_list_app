import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier{

  List<Movies> _movieList = [
    // "The Shawshank Redemption",
    // "The Godfather",
    // "The Dark Knight",
    // "The Godfather: Part II",
    // "The Lord of the Rings: The Return of the King",
    // "Minority Report",
    // "The Truman Show",
    // "Schindlers List",
    // "The Covenant",
    // "Forrest Gump",
    // "Inception",
    // "Terminator 2: Judgement Day"
  ];

  List<Movies> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try{
      final jsonString = await DefaultAssetBundle.of(context).loadString('assets/data/films.json');
      final movies = MovieParser.parse(jsonString);
      _movieList = movies;
      notifyListeners();
    } catch (e) {
      print("Error loading movies: $e");
    }
  }
  // List<Movies> loadMovies() {
  //   return _movieList;
  // }
}
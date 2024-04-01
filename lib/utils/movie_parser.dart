import 'dart:convert';

import 'package:movie_app/models/movies.dart';

class MovieParser{
  static List<Movies> parse(String jsonString) {
    final List<dynamic> parsedJson = jsonDecode(jsonString);
    return parsedJson.map((jsonItem) => Movies.fromJson(jsonItem as Map<String, dynamic>)).toList();
  }
}
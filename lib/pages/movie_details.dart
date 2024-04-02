import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_detailed_card.dart';
import 'package:movie_app/models/movies.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movies movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(movie.title)
      ),
      body: Container(
        child: Column(children: [
          MovieDetailedCard(movie: movie)

        ],),
      ),
    

    );
  }
}
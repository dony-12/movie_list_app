
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/pages/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text("IMDB Rating: ${movie.imdbRating} | Genre(s): ${movie.genre} | Director: ${movie.director}"),
        leading: Container(
          width: 45.0,
          height: 70.0,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(movie.images[0]), fit:BoxFit.cover)),
          // backgroundImage: NetworkImage(movie.images[0]),
      ),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
            RichText(text: 
            TextSpan(style: DefaultTextStyle.of(context).style,
              children: [
              TextSpan(
                text: "Released: ",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)
              ),
              TextSpan(text: "${movie.released}\n"),
              TextSpan(text: "Plot: ", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(text: movie.plot)
          ])
          ),
          TextButton(onPressed: () {
             Navigator.push(context, 
             MaterialPageRoute(builder: (context) => MovieDetails(movie: movie,))
            );
          }, child: const Text("Read More"))
          ],
            
          ),
        )
      ],
      ),
    );
  }
}
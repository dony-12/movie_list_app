import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';

class MovieDetailedCard extends StatelessWidget {
  const MovieDetailedCard({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
          Text("Movie Scenes", style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.images.length,
              itemBuilder: (context, index) {
              return Card(
                elevation: 8.0,
                child: Image.network(movie.images[index],
                fit: BoxFit.fill
                ),
                
              );
            },)
          ),
          RichText(
            text: 
          TextSpan(style: DefaultTextStyle.of(context).style,
            children: [
            TextSpan(
              text: "Director: ",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)
            ),
            TextSpan(text: "${movie.director}\n"),
            TextSpan(
              text: "Released: ",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)
            ),
            TextSpan(text: "${movie.released}\n\n"),
            TextSpan(text: "Plot: ", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: movie.plot)
        ])
        ),
        ],
          
        ),
      ),
    );
  }
}
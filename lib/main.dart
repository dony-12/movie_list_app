import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => MovieProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 18, 18, 19)),
        useMaterial3: true,
      ),
      home: const Home());
  }
}

class Home extends StatefulWidget {
    const Home({super.key});
  
    @override
    State<Home> createState() => _HomeState();
}
  
class _HomeState extends State<Home> {
    @override
    void initState() {
      Provider.of<MovieProvider>(context, listen:false).loadMovies(context);
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
      final movies = Provider.of<MovieProvider>(context);
      return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
        ),
        body: 
        Center(
          child: ListView.builder(
            itemCount: movies.movieList.length,
            itemBuilder: (context, index) {
            final movie = movies.movieList[index];
            return MovieCard(movie: movie);
          }),
        ),
      );
    }
  }



import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screen/detailed_screen.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/widget/preview.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<MoviesProvider>().fetchTopRated();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<MoviesProvider>(context);
    return moviesProvider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              ...moviesProvider
                  .topRatedMovies[moviesProvider.topRatedMoviesIndex]
                  .map(
                (movie) => GestureDetector(
                  onTap: () => moviesProvider.topRatedMovies.isEmpty
                      ? null
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieDetails(
                                movie: movie,
                              );
                            },
                          ),
                        ),
                  child: PreviewWidget(
                    movie: movie,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  moviesProvider.fetchTopRated(
                    id: moviesProvider.topRatedMoviesIndex + 1,
                    page: moviesProvider.topRatedMoviesIndex + 1,
                    );
                },
                child: const Text("Next"),
              )
            ],
          );
  }
}
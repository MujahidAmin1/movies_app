import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screen/detailed_screen.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/widget/preview.dart';


class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<MoviesProvider>().fetchPopular();
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
                  .popularMovies[moviesProvider.popularMoviesIndex]
                  .map(
                (movie) => GestureDetector(
                  onTap: () => moviesProvider.popularMovies.isEmpty
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
                  moviesProvider.fetchPopular(
                    id: moviesProvider.popularMoviesIndex + 1,
                    page: moviesProvider.popularMoviesIndex + 1,
                    );
                },
                child: const Text("Next"),
              )
            ],
          );
  }
}
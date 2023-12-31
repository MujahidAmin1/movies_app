import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screen/detailed_screen.dart';
import 'package:movies_app/widget/preview.dart';
import 'package:provider/provider.dart';


class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<MoviesProvider>().fetchUpcoming();
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
                  .topRatedMovies[moviesProvider.upcomingMoviesIndex]
                  .map(
                (movie) => GestureDetector(
                  onTap: () => moviesProvider.upcomingMovies.isEmpty
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
                  moviesProvider.fetchUpcoming(
                    id: moviesProvider.upcomingMoviesIndex + 1,
                    page: moviesProvider.upcomingMoviesIndex + 1,
                    );
                },
                child: const Text("Next"),
              )
            ],
          );
  }
}
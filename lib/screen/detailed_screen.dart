
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';

class MovieDetails extends StatefulWidget {
  Movie? movie;
  MovieDetails({super.key, this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var moviesProvider = Provider.of<MoviesProvider>(context);
    var img = "https://image.tmdb.org/t/p/original/${widget.movie!.backdropPath}";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: img,
              height: height / 2,
            ),
            Text(widget.movie!.title!),
            Text(widget.movie!.overview!),
            Text(widget.movie!.popularity.toString())
          ],
        ),
      ),
    );
  }
}

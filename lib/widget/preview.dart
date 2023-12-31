import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

class PreviewWidget extends StatelessWidget {
  Movie? movie;
  
  PreviewWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.yellow,
      ),
      child: Column(
        children: [
          Container(
            child: CachedNetworkImage(
              height: 220,
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: "https://image.tmdb.org/t/p/original/${movie!.backdropPath!}",
            ),
          ),
          Text(movie!.title!, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

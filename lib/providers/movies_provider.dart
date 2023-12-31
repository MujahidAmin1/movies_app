import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/http_services.dart';

typedef MoviesCollection = List<List<Movie>>;

class MoviesProvider extends ChangeNotifier {
  Movie? movie;
  MoviesCollection topRatedMovies = [];
  MoviesCollection popularMovies = [];
  MoviesCollection upcomingMovies = [];
  bool isLoading = false;
  int popularMoviesIndex = 0;
  int topRatedMoviesIndex = 0;
  int upcomingMoviesIndex = 0; // Corrected variable name

  void toggle() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchUpcoming({int? id, int page = 1}) async {
    List<Movie> _upcomingMovies = [];
    try {
      toggle();
      _upcomingMovies = await ApiServices.getUpcomingMovies(id ?? upcomingMoviesIndex + 1, page: page);
      upcomingMovies.add(_upcomingMovies);
    } on SocketException catch (e) {
      // Handle SocketException if needed
    } finally {
      toggle();
      notifyListeners();
    }
  }

  void fetchTopRated({int? id, int page = 1}) async {
    List<Movie> _topRatedMovies = [];
    try {
      toggle();
      _topRatedMovies = await ApiServices.getTopRatedMovies(id ?? topRatedMoviesIndex + 1, page: page);
      topRatedMovies.add(_topRatedMovies);
    } on SocketException catch (e) {
      // Handle SocketException if needed
    } finally {
      toggle();
      notifyListeners();
    }
  }

  void fetchPopular({int? id, int page = 1}) async {
    List<Movie> _popularMovies = [];
    try {
      toggle();
      _popularMovies = await ApiServices.getPopularMovies(id ?? popularMoviesIndex + 1, page: page);
      popularMovies.add(_popularMovies);
    } on SocketException catch (e) {
      // Handle SocketException if needed
    } finally {
      toggle();
      notifyListeners();
    }
  }
}

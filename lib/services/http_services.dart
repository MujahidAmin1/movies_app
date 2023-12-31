import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';

class ApiServices {
  int currentPage = 1;

  static Future<List<Movie>> getPopularMovies(int? pageNum) async {
    String popular =
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$pageNum&api_key=9e3f8be4fa77236988d6cfb2164792c7";
    Response response = await get(Uri.parse(popular));
    if (response.statusCode == 200) {
      final popularJson = jsonDecode(response.body);
      List<dynamic> body = popularJson['results'];
      List<Movie> popularMovies =
          body.map((dynamic item) => Movie.fromJson(item)).toList();
      log(popularMovies.length.toString());
      return popularMovies;
    } else {
      throw ("can't");
    }
  }

  static Future<List<Movie>> getTopRatedMovies(int? pageNum) async {
    String top_rated =
        "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$pageNum&api_key=9e3f8be4fa77236988d6cfb2164792c7";
    Response response = await get(Uri.parse(top_rated));

    if (response.statusCode == 200) {
      final topRatedJson = jsonDecode(response.body);
      List<dynamic> body = topRatedJson['results'];
      List<Movie> topRatedMovies =
          body.map((dynamic item) => Movie.fromJson(item)).toList();
      log(topRatedMovies.length.toString());
      return topRatedMovies;
    } else {
      throw ("can't");
    }
  }

  static Future<List<Movie>> getUpcomingMovies(int? pageNum) async {
    var upcoming =
        "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=$pageNum&api_key=9e3f8be4fa77236988d6cfb2164792c7";
    Response response = await get(Uri.parse(upcoming));

    if (response.statusCode == 200) {
      final upcomingJson = jsonDecode(response.body);
      List<dynamic> body = upcomingJson['results'];
      List<Movie> upcomingMovies =
          body.map((dynamic item) => Movie.fromJson(item)).toList();
      log(upcomingMovies.length.toString());
      return upcomingMovies;
    } else {
      throw ("can't");
    }
  }
}
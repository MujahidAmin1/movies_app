import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MoviesProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      )));
}

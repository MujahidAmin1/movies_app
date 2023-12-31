

import 'package:flutter/material.dart';
import 'package:movies_app/screen/popular_screen.dart';
import 'package:movies_app/screen/toprated_screen.dart';
import 'package:movies_app/screen/upcoming_screen.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

  class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  @override
  

  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<MoviesProvider>(context);
    List<Widget> mylist = [
      const PopularScreen(),
      const UpcomingScreen(),
      const TopRatedScreen(),
    ];
    return Scaffold(
      body:
          IndexedStack(
          index: selectedIndex, 
          children: mylist
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.upcoming_rounded), label: "Popular"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Upcoming"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp), label: "TopRated"),
        ],
        currentIndex: selectedIndex,
        onTap: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
      ),
    );
  }
}

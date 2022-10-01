
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apiKey = '5e8910fa6faed6f61e631d9cbccab93a';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZTg5MTBmYTZmYWVkNmY2MWU2MzFkOWNiY2NhYjkzYSIsInN1YiI6IjYzMzdmNDQ2NDJkOGE1MDA3YTE2OTI3ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V4jjrPytRhfuZBudExxnkFgdSjsDyapmwAd-7-umspM';
 void initState(){
   loadmovies();
   super.initState();
 }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
    ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingMovies);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Movie App'),
      ),
      body: Column(children: [],),
    );
  }
}


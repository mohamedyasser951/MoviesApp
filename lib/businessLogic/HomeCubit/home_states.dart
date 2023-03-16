import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/persons_model.dart';

abstract class MovieStates {}

class Initstate extends MovieStates {}

//Now Playing
class NowPlayingSuccessState extends MovieStates {
  final MainModel model;

  NowPlayingSuccessState({required this.model});
}

class NowPlayingErrorState extends MovieStates {}

class NowPlayingLoadingState extends MovieStates {}

//Trending people
class GetTrendingPeopleSuccessState extends MovieStates {
  final TrendPersonModel model;
  GetTrendingPeopleSuccessState({required this.model});
}

class GetTrendingPeopleErrorState extends MovieStates {}

class GetTrendingPeopleLoadingState extends MovieStates {}

//Get TopRate
class GetTopRateSuccessState extends MovieStates {
  MainModel model;
  GetTopRateSuccessState({required this.model});
}

class GetTopRateErrorState extends MovieStates {}

class GetTopRateLoadingState extends MovieStates {}

//Get Genere
class GetGenereSuccessState extends MovieStates {
  // final GenreModel model;
  GetGenereSuccessState();
}

class GetGenereErrorState extends MovieStates {}

class GetGenereLoadingState extends MovieStates {}

//Get Movie by GenereId
class GetMovieByGenereIdSuccessState extends MovieStates {
  final List<Results> model;
  GetMovieByGenereIdSuccessState({required this.model});
}

class GetMovieByGenereIdErrorState extends MovieStates {}

class GetMovieByGenereIdLoadingState extends MovieStates {}

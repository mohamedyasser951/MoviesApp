import 'package:movieapp/data/models/now_playing_model.dart';
import 'package:movieapp/data/models/top_rated_model.dart';
import 'package:movieapp/data/models/tranding_person_model.dart';

abstract class MovieStates {}

class Initstate extends MovieStates {}

//Now Playing
class NowPlayingSuccessState extends MovieStates {
  final NowPlayingModel model;

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
  TopRateModel model;
  GetTopRateSuccessState({required this.model});
}

class GetTopRateErrorState extends MovieStates {}

class GetTopRateLoadingState extends MovieStates {}

//Get Genere
class GetGenereSuccessState extends MovieStates {}

class GetGenereErrorState extends MovieStates {}

class GetGenereLoadingState extends MovieStates {}

//Get Movie by GenereId
class GetMovieByGenereIdSuccessState extends MovieStates {}

class GetMovieByGenereIdErrorState extends MovieStates {}

class GetMovieByGenereIdLoadingState extends MovieStates {}

//Get MoviebyId
class GetMovieByIdSuccessState extends MovieStates {}

class GetMovieByIdErrorState extends MovieStates {}

class GetMovieByIdLoadingState extends MovieStates {}

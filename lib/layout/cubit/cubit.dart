import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/ApiServices/ApiServices.dart';
import 'package:movieapp/ApiServices/endpoints.dart';
import 'package:movieapp/layout/cubit/states.dart';
import 'package:movieapp/models/movie.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(Initstate());

  static MovieCubit get(context) => BlocProvider.of(context);

  final String apiKey = "9b739e457a86270518ffb851854d6f58";
  //static String mainUrl = "https://api.themoviedb.org/3";

  // MovieModel? movieModel;
  List movies = [];
  getNowplaying() async {
    emit(NowPlayingLoadingState());
    print("loading");
    ApiService.getData(
            url: NOWPLAYING,
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
      movies = value.data["results"];
      //print(value.data["results"][0]["adult"]);
      // print(movies);

      emit(NowPlayingSuccessState());
    }).catchError((e) {
      print(e.toString());
      NowPlayingErrorState();
    });
  }

  List persons = [];

  getTrendingPerson() async {
    emit(GetTrendingPeopleLoadingState());

    ApiService.getData(
            url: TrendingPERSON,
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
      persons = value.data["results"];
      print(persons);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }



 List toprate = [];

  getTopRate() async {
    emit(GetTrendingPeopleLoadingState());

    ApiService.getData(
            url: TOPRATED,
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
      toprate = value.data["results"];
      print(toprate);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }








}

// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/apiservice/endpoints.dart';
import 'package:movieapp/data/models/now_playing_model.dart';
import 'package:movieapp/data/models/tranding_person_model.dart';
import 'package:movieapp/data/models/genere_model.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/top_rated_model.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(Initstate());

  static MovieCubit get(context) => BlocProvider.of(context);

  final String apiKey = "9b739e457a86270518ffb851854d6f58";

  late NowPlayingModel nowplayingModel;
  getNowplaying() {
    emit(NowPlayingLoadingState());
    ApiService.getData(
      url: NOWPLAYING,
    ).then((value) {
      nowplayingModel = NowPlayingModel.fromJson(value.data);
      print(value.data);
      print("now plating= ${nowplayingModel.results!.length}");
      emit(NowPlayingSuccessState());
    }).catchError((e) {
      print("now plaing error${e.toString()}");
      emit(NowPlayingErrorState());
    });
  }

  late TrendPersonModel trendPersonModel;
  getTrendingPerson() {
    emit(GetTrendingPeopleLoadingState());

    ApiService.getData(
      url: TrendingPERSON,
    ).then((value) {
      trendPersonModel = TrendPersonModel.fromJson(value.data);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }

  TopRateModel? topRateModel;
  getTopRate() {
    emit(GetTrendingPeopleLoadingState());

    ApiService.getData(
      url: TOPRATED,
    ).then((value) {
      topRateModel = TopRateModel.fromJson(value.data);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }

  GenereModel? genereModel;
  getGenre() {
    emit(GetGenereLoadingState());
    ApiService.getData(
      url: GENERE,
    ).then((value) {
      genereModel = GenereModel.froJson(value.data);
      emit(GetGenereSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetGenereErrorState());
    });
  }

  MovieModel? movieModel;
  getMovieByGenreId({required int movieId}) {
    emit(GetMovieByGenereIdLoadingState());
    ApiService.getData(
      url: " $MOVIEBYGENREID?with_genres=$movieId",
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      emit(GetMovieByGenereIdSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetMovieByGenereIdErrorState());
    });
  }

  getMovieDetails(){}

}

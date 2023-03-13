// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/apiservice/endpoints.dart';
import 'package:movieapp/data/models/main_model.dart';
import 'package:movieapp/data/models/movie2.dart';
import 'package:movieapp/data/models/now_playing_model.dart';
import 'package:movieapp/data/models/tranding_person_model.dart';
import 'package:movieapp/data/models/genere_model.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(Initstate());

  static MovieCubit get(context) => BlocProvider.of(context);

  final String apiKey = "9b739e457a86270518ffb851854d6f58";

  late NowPlayingModel nowplayingModel;
  Future<NowPlayingModel> getNowplaying() async {
    emit(NowPlayingLoadingState());
    await ApiService.getData(
      url: NOWPLAYING,
    ).then((value) {
      nowplayingModel = NowPlayingModel.fromJson(value.data);
      // print(value.data);
      // print("now plating= ${nowplayingModel.results!.length}");
      emit(NowPlayingSuccessState(model: nowplayingModel));
    }).catchError((e) {
      print("now plaing error${e.toString()}");
      emit(NowPlayingErrorState());
    });
    return nowplayingModel;
  }

  late TrendPersonModel trendPersonModel;
  Future<TrendPersonModel> getTrendingPerson() async {
    emit(GetTrendingPeopleLoadingState());

    await ApiService.getData(
      url: TrendingPERSON,
    ).then((value) {
      trendPersonModel = TrendPersonModel.fromJson(value.data);
      emit(GetTrendingPeopleSuccessState(model: trendPersonModel));
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
    return trendPersonModel;
  }

  late MainModel mainModel;
  Future<MainModel> getTopRate() async {
    emit(GetTopRateLoadingState());

    await ApiService.getData(
      url: TOPRATED,
    ).then((value) {
      mainModel = MainModel.fromJson(value.data);
      emit(GetTopRateSuccessState(model: mainModel));
    }).catchError((e) {
      print(e.toString());
      GetTopRateErrorState();
    });
    return mainModel;
  }

  GenreModel? genereModel;
  getGenre() async {
    emit(GetGenereLoadingState());
    await ApiService.getData(
      url: GENERE,
    ).then((value) {
      print(value.data);

      genereModel = GenreModel.fromJson(value.data);

      emit(GetGenereSuccessState(model: genereModel!));
    }).catchError((e) {
      print(e.toString());
      emit(GetGenereErrorState());
    });
  }

  List<Results1> moviedata = [];
  getMovieByGenreId({int movieId = 12}) {
    emit(GetMovieByGenereIdLoadingState());
    ApiService.getData(
      url: "$MOVIEBYGENREID?with_genres=$movieId",
    ).then((value) {
      value.data["results"].forEach((e) {
        print("one item $e");
        moviedata.add(Results1.fromJson(e));
      });

      print("get movie by genre id ${moviedata.length}");

      emit(GetMovieByGenereIdSuccessState(model: moviedata));
    }).catchError((e) {
      print(e.toString());
      emit(GetMovieByGenereIdErrorState());
    });
  }
}

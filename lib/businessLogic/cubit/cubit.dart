import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/apiservice/endpoints.dart';
import 'package:movieapp/data/models/NowplayingModel.dart';
import 'package:movieapp/data/models/TrandingPersonModel.dart';
import 'package:movieapp/data/models/topRtedModel.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(Initstate());

  static MovieCubit get(context) => BlocProvider.of(context);

  final String apiKey = "9b739e457a86270518ffb851854d6f58";

  late NowPlayingModel nowplayingModel;
  getNowplaying() {
    emit(NowPlayingLoadingState());
    print("now plaing loading");
    ApiService.getData(
            url: NOWPLAYING,
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
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
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
      trendPersonModel = TrendPersonModel.fromJson(value.data);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }

  late TopRateModel topRateModel;
  getTopRate() {
    emit(GetTrendingPeopleLoadingState());

    ApiService.getData(
            url: TOPRATED,
            queryParmeters: {"api_key": apiKey, "language": "en-US", "page": 1})
        .then((value) {
      topRateModel = TopRateModel.fromJson(value.data);
      emit(GetTrendingPeopleSuccessState());
    }).catchError((e) {
      print(e.toString());
      GetTrendingPeopleErrorState();
    });
  }
}

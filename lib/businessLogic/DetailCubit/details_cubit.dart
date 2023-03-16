import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/DetailCubit/details_states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/models/casts_model.dart';
import 'package:movieapp/data/models/movie_detail_model.dart';
import 'package:movieapp/data/models/movie_model.dart';

class DetailCubit extends Cubit<DetailStates> {
  DetailCubit() : super(IntialDetailState());

  static DetailCubit get(context) => BlocProvider.of(context);

  late MovieDetailModel movieDetailModel;
  getMovieDetails({required int id}) {
    emit(GetMovieByIdLoadingState());
    ApiService.getData(url: "/movie/$id").then((value) async {
      movieDetailModel = MovieDetailModel.fromjson(value.data);
      movieDetailModel.youtubeUrl = await getYoutubeId(id: id);
      movieDetailModel.similarMovies = await getSimilarMovies(id: id);
      movieDetailModel.castModel = await getMovieCasts(id: id);

      emit(GetMovieByIdSuccessState());
    }).catchError((e) {
      // print(e.toString());
      emit(GetMovieByIdErrorState());
    });
  }

  Future<String> getYoutubeId({required int id}) async {
    try {
      var response = await ApiService.getData(url: "/movie/$id/videos");
      return response.data["results"][0]["key"];
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MainModel> getSimilarMovies({required int id}) async {
    try {
      var response = await ApiService.getData(url: "/movie/$id/similar");
      return MainModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  getMovieCasts({required int id}) async {
    try {
      var response = await ApiService.getData(url: "/movie/$id/credits");
      return CastModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}

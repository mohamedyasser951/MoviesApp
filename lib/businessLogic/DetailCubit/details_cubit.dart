import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/DetailCubit/details_states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/models/casts_model.dart';
import 'package:movieapp/data/models/movie_detail_model.dart';
import 'package:movieapp/data/models/top_rated_model.dart';

class DetailCubit extends Cubit<DetailStates> {
  DetailCubit() : super(IntialDetailState());

  static DetailCubit get(context) => BlocProvider.of(context);

  late MovieDetailModel movieDetailModel;
  getMovieDetails({required int movieId}) {
    emit(GetMovieByIdLoadingState());
    ApiService.getData(url: "/movie/$movieId").then((value) async {
      movieDetailModel = MovieDetailModel.fromjson(value.data);
      print("get movie by id method${value.data}");
      await getYoutubeId(movieId: movieId);
      await getSimilarMovies(id: movieId);
      await getMovieCasts(id: movieId);
      emit(GetMovieByIdSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetMovieByIdErrorState());
    });
  }

  String? youtubeUrl;
  Future<String> getYoutubeId({required int movieId}) async {
    await ApiService.getData(url: "/movie/$movieId/videos").then((value) {
      youtubeUrl = value.data["results"][0]["key"];
    }).catchError((e) {
      print(e.toString());
    });
    print(youtubeUrl);

    return youtubeUrl!;
  }

  TopRateModel? similarMovieModel;
  getSimilarMovies({required int id}) async {
    await ApiService.getData(url: "/movie/$id/similar").then((value) {
      similarMovieModel = TopRateModel.fromJson(value.data);
      print("GetSimilarMovie ${value.data}");
    }).catchError((e) {
      print(e.toString());
    });
    return similarMovieModel;
  }

  List<Cast> casts = [];
  getMovieCasts({required int id}) async {
    await ApiService.getData(url: "/movie/$id/credits").then((value) {
      value.data['cast'].forEach((v) {
        casts.add(Cast.fromJson(v));
      });
      print("GetMovieCasts ${value.data}");
    }).catchError((e) {
      print(e.toString());
    });
    return casts;
  }
}

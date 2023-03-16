import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/SearchCubit/search_state.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/data/models/movie_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(IntialSearchState());

  SearchCubit get(context) => BlocProvider.of(context);

  search({required String movieName}) async {
    emit(LoadingSearchState());
    try {
      var response = await ApiService.getData(
          url:
              "/search/movie?api_key=9b739e457a86270518ffb851854d6f58&query=$movieName");

      // print(response.data);

      MainModel searchModel = MainModel.fromJson(response.data);
      if (searchModel.results!.isEmpty) {
        emit(EmptySearchState());
      }
      emit(SuccessSearchState(model: searchModel));
    } catch (error) {
      emit(ErorrSearchState());
    }
  }
}

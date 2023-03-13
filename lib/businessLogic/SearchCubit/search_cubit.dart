import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/SearchCubit/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(IntialSearchState());

  SearchCubit get(context) => BlocProvider.of(context);
}

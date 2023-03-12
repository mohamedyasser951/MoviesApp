import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/presentation/widgets/movie_item.dart';

class GenreMoviesBuilder extends StatelessWidget {
  const GenreMoviesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetMovieByGenereIdLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetMovieByGenereIdErrorState) {
          return const Center(
            child: Text("Something went Wrong !!"),
          );
        } else if (cubit.moviedata.isNotEmpty) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: cubit.moviedata.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieItem(model: cubit.moviedata[index]);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

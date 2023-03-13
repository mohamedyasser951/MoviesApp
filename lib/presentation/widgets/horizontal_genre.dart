import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_states.dart';
import 'package:movieapp/component/styles/style.dart';

class HorizontalGenre extends StatelessWidget {
  const HorizontalGenre({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit = MovieCubit.get(context);
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetGenereLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetGenereErrorState) {
          return const Center(
            child: Text("Something Wrong"),
          );
        } else if (state is GetGenereSuccessState) {
          return SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.genereModel!.genres!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    cubit.getMovieByGenreId(
                        movieId: cubit.genereModel!.genres![index].id!);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    decoration: BoxDecoration(
                      color: CustomColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(cubit.genereModel!.genres![index].name!)),
                  ),
                );
              },
            ),
          );
        }
        return Container(
          color: Colors.amber,
          height: 50,
        );
      },
    );
  }
}

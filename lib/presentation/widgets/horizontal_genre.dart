import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_states.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';

class HorizontalGenre extends StatefulWidget {
  const HorizontalGenre({super.key});

  @override
  State<HorizontalGenre> createState() => _HorizontalGenreState();
}

class _HorizontalGenreState extends State<HorizontalGenre> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        
        if (state is GetGenereLoadingState) {
          return  Center(
            child:  buildMovielistLoaderWidget(context),
          );
        } else if (state is GetGenereErrorState) {
          return const Center(
            child: Text("Something Wrong"),
          );
        } else if (cubit.genereModel != null) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.genereModel!.genres!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = index;
                    });
                    cubit.getMovieByGenreId(
                        movieId: cubit.genereModel!.genres![index].id!);
                  },
                  
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    // width: 100,
                    decoration: BoxDecoration(
                      color: isSelected == index
                          ? CustomColors.secondaryColor
                          : CustomColors.scaffoldDarkBack,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(cubit.genereModel!.genres![index].name!,maxLines: 1,)),
                  ),
                );
              },
            ),
          );
        }
        return Container(
          height: 50,
        );
      },
    );
  }
}

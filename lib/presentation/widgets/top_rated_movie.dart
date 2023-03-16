import 'package:flutter/material.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/presentation/widgets/movie_item.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';

class TopRateWidget extends StatelessWidget {
  final int index;
  const TopRateWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainModel>(
      future: MovieCubit.get(context).getTopRate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(
            child: buildMovielistLoaderWidget(context),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MovieItem(model: snapshot.data!.results![index]);
        }
        return const Center(child: Text('oops Something Wrong'));
      },
    );
  }
}

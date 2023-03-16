import 'package:flutter/widgets.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/presentation/widgets/movie_item.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';

class TopRatedMovieBuilder extends StatelessWidget {
  const TopRatedMovieBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainModel>(
      future: MovieCubit.get(context).getTopRate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: buildMovielistLoaderWidget(context),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: snapshot.data!.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieItem(model: snapshot.data!.results![index]);
              },
            ),
          );
        }
        return const Center(child: Text('oops Something Wrong'));
      },
    );
  }
}

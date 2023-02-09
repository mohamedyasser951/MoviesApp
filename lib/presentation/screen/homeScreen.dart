import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/widgets/now_playingMovie.dart';
import 'package:movieapp/presentation/widgets/topPersonRate.dart';
import 'package:movieapp/presentation/widgets/topRatedMovie.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      MovieCubit.get(context).getTrendingPerson();
        MovieCubit.get(context).getNowplaying();
       MovieCubit.get(context).getTopRate();
      return BlocConsumer<MovieCubit, MovieStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MovieCubit.get(context);
           print(cubit.nowplayingModel.results!.length);

            return Scaffold(
              backgroundColor: CustomColors.bottomDarkBack,
              appBar: AppBar(
                backgroundColor: CustomColors.bottomDarkBack,
                leading: const Icon(
                  EvaIcons.menu2Outline,
                  color: Colors.white,
                ),
                centerTitle: true,
                title: const Text("Movie APP",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                actions: [
                  IconButton(
                      onPressed: () async {
                        MovieCubit.get(context).getNowplaying();
                      },
                      icon: const Icon(
                        EvaIcons.searchOutline,
                        color: Colors.white,
                      ))
                ],
              ),
              body: ListView(
                children: [
                  const NowPlaying(),
                  Container(
                    height: 200.0,
                  ),
                  Text(
                    'Trending Person in this week',
                    style: TextStyle(color: CustomColors.elementBack),
                  ),
                 PersonsList(),
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(color: CustomColors.elementBack),
                  ),
                  Container(
                    height: 270,
                    child: ListView.builder(
                      itemCount: cubit.topRateModel.results!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TopRateWidget(
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}




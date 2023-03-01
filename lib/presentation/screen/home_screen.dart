import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/widgets/now_playingMovie.dart';
import 'package:movieapp/presentation/widgets/top_person_rate.dart';
import 'package:movieapp/presentation/widgets/top_rated_movie_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // MovieCubit.get(context).getTrendingPerson();
      // MovieCubit.get(context).getNowplaying();
      // MovieCubit.get(context).getTopRate();
      // MovieCubit.get(context).getGenre();
      return BlocConsumer<MovieCubit, MovieStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    const NowPlaying(),
                   const  SizedBox(height: 20.0,),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:const EdgeInsets.only(right: 10.0),
                            padding:const EdgeInsets.all(8),
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(child:  Text("Drama")),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 300.0,
                    ),
                    Text(
                      'Trending Person on this week',
                      style: TextStyle(
                          color: CustomColors.elementBack, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const PersonsList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Text(
                        'Top Rated Movies',
                        style: TextStyle(
                            color: CustomColors.elementBack, fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const TopRatedMovieBuilder(),
                  ],
                ),
              ),
            );
          });
    });
  }
}

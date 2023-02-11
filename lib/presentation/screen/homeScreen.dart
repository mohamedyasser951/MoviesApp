import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/businessLogic/cubit/states.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/data/models/genereModel.dart';
import 'package:movieapp/presentation/widgets/now_playingMovie.dart';
import 'package:movieapp/presentation/widgets/topPersonRate.dart';
import 'package:movieapp/presentation/widgets/topRatedMovie.dart';

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
      MovieCubit.get(context).getTrendingPerson();
      MovieCubit.get(context).getNowplaying();
      MovieCubit.get(context).getTopRate();
      MovieCubit.get(context).getGenre();
      return BlocConsumer<MovieCubit, MovieStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MovieCubit.get(context);
            List<GenereData> genres = [];
            print(cubit.genereModel.genres!.length);

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
                      height: 300.0,
                      child: DefaultTabController(
                          length: cubit.genereModel.genres!.length,
                          child: Scaffold(
                            backgroundColor: CustomColors.bottomDarkBack,
                            appBar: PreferredSize(
                              preferredSize: const Size.fromHeight(50.0),
                              child: AppBar(
                                backgroundColor: CustomColors.bottomDarkBack,
                                bottom: TabBar(
                                    isScrollable: true,
                                    indicatorColor: CustomColors.thirdColor,
                                    tabs: cubit.genereModel.genres!.map((e) {
                                      return Tab(
                                        text: e.name,
                                        icon: Icon(Icons.home),
                                        child: Text("${e.name}}"),
                                      );
                                    }).toList()),
                              ),
                            ),
                            body: TabBarView(
                              children: [
                                for (int i = 1; i <= 19; i++)
                                  Container(
                                    color: Colors.amber,
                                   // child: Text("${genres[i-1].id}"),
                                  )
                              ],
                              // children: genres.map((e) {
                              //   return Container(color: Colors.red,);
                              // }).toList(),
                            ),
                          ))),
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

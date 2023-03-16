import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_states.dart';
import 'package:movieapp/businessLogic/SearchCubit/search_cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/screen/search_screen.dart';
import 'package:movieapp/presentation/widgets/genre_builder.dart';
import 'package:movieapp/presentation/widgets/horizontal_genre.dart';
import 'package:movieapp/presentation/widgets/now_playing.dart';
import 'package:movieapp/presentation/widgets/top_person.dart';
import 'package:movieapp/presentation/widgets/top_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    MovieCubit.get(context).getGenre();
    MovieCubit.get(context).getMovieByGenreId(movieId: 10751);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => SearchCubit(),
                            child: const SearchScreen(),
                          ),
                        ));
                      },
                      icon: const Icon(
                        EvaIcons.searchOutline,
                        color: Colors.white,
                      ))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NowPlaying(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const HorizontalGenre(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const GenreMoviesBuilder(),
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
              ),
            );
          });
    });
  }
}

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/layout/cubit/cubit.dart';
import 'package:movieapp/layout/cubit/states.dart';
import 'package:movieapp/widgets/now_playingMovie.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
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
                NowPlaying(),
                Container(
                  height: 200.0,
                ),
                Text(
                  'Trending Person in this week',
                  style: TextStyle(color: CustomColors.elementBack),
                ),
                const PersonsList(),
                Text(
                  'Top Rated Movies',
                  style: TextStyle(color: CustomColors.elementBack),
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                    itemCount: cubit.toprate.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TopRateWidget(index: index,);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class TopRateWidget extends StatelessWidget {
  int index;
   TopRateWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return Container(
      height: 260,
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 170,
               decoration: BoxDecoration(
                      
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  cubit.toprate[index]['backdrop_path']))),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            cubit.toprate[index]["title"],
            maxLines: 2,
            style:const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                height: 1.4,
                color: Colors.white),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(cubit.toprate[index]["vote_average"].toString(),maxLines: 2,),
                const SizedBox(
                  width: 40,
                ),
                SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  color: CustomColors.thirdColor,
                  borderColor: Colors.white,
                  spacing: 2,
                  onRatingChanged: (rating) {},
                  rating: cubit.toprate[index]["vote_average"]/2,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonsList extends StatelessWidget {
  const PersonsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return Container(
      height: 130,
      child: ListView.builder(
        itemCount: cubit.persons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  cubit.persons[index]['profile_path']))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.persons[index]["name"],
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  "Trending for " +
                      cubit.persons[index]["known_for_department"],
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: CustomColors.elementBack),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/businessLogic/DetailCubit/details_cubit.dart';
import 'package:movieapp/businessLogic/DetailCubit/details_states.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit()..getMovieDetails(movieId: movieId),
      child: BlocBuilder<DetailCubit, DetailStates>(builder: (context, state) {
        var cubit = BlocProvider.of<DetailCubit>(context);
        if (state is GetMovieByIdLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return WillPopScope(
          onWillPop: () async => true,
          child: Scaffold(
            backgroundColor: CustomColors.bottomDarkBack,
            body: CustomScrollView(
              slivers: [
                SilverAppBar(cubit: cubit),
                SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            cubit.movieDetailModel.voteAverage!.toString(),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SmoothStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            color: CustomColors.thirdColor,
                            borderColor: Colors.white,
                            spacing: 2,
                            onRatingChanged: (rating) {},
                            rating: cubit.movieDetailModel.voteAverage!,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Overview"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        cubit.movieDetailModel.overview!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "BUDGET",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "DURATION",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "RELEASE DATE",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            cubit.movieDetailModel.budget!.toString(),
                            style: TextStyle(color: CustomColors.thirdColor),
                          ),
                          Text(
                            "120 min",
                            style: TextStyle(color: CustomColors.thirdColor),
                          ),
                          Text(
                            cubit.movieDetailModel.releaseDate!,
                            style: TextStyle(color: CustomColors.thirdColor),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("CASTS"),
                    ),
                    CastsBuilder(cubit: cubit),
                    const SizedBox(
                      height: 6,
                    ),
                    const SimilarMovieBuilder(),
                  ])),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SimilarMovieBuilder extends StatelessWidget {
  const SimilarMovieBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var model = DetailCubit.get(context).similarMovieModel;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 230,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${model!.results![index].posterPath}"))),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    model.results![index].title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.results![index].voteAverage.toString(),
                        maxLines: 2,
                      ),
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
                        rating: model.results![index].voteAverage! / 2,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    super.key,
    required this.cubit,
  });

  final DetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      backgroundColor: CustomColors.bottomDarkBack,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          cubit.movieDetailModel.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18),
        ),
        background: Stack(children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${cubit.movieDetailModel.poster!}")),
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.0),
                ])),
          ),
          Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              left: 0,
              child: IconButton(
                onPressed: () async {
                  final youtubeUrl =
                      'https://www.youtube.com/embed/${cubit.youtubeUrl}';
                  if (await canLaunchUrl(Uri.parse(youtubeUrl))) {
                    await launchUrl(
                      Uri.parse(youtubeUrl),
                    );
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.circlePlay,
                  size: 40.0,
                  color: CustomColors.secondaryColor,
                ),
              )),
        ]),
      ),
    );
  }
}

class CastsBuilder extends StatelessWidget {
  const CastsBuilder({
    super.key,
    required this.cubit,
  });

  final DetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: cubit.casts.length,
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
                              "https://image.tmdb.org/t/p/w500${cubit.casts[index].profilePath}"))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.casts[index].name!,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  cubit.casts[index].knownForDepartment!,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 10.0,
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

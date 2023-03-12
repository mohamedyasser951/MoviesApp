import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    MovieCubit.get(context).getMovieDetails(movieId: widget.movieId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: CustomColors.bottomDarkBack,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: CustomColors.bottomDarkBack,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  cubit.movieDetailModel.title!,
                  style: const TextStyle(fontSize: 12),
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
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
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
                  )
                   ,Positioned(
                          bottom: 0,
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Icon(
                            FontAwesomeIcons.circlePlay,
                            size: 40.0,
                            color: CustomColors.secondaryColor,
                          )),
                          
                  
                ]),
              ),
            ),
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
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png"))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "name",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.4,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              "Role",
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
                )
              ])),
            ),
          ],
        ),
      );
    });
  }
}

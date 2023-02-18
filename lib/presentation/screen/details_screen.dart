import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return Builder(builder: (context) {
      MovieCubit.get(context).getMovieByGenreId(movieId: 505642);
      return Scaffold(
        backgroundColor: CustomColors.bottomDarkBack,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: CustomColors.bottomDarkBack,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(cubit.movieModel!.title!),
                background: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png")),
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
                        "8.6",
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
                        rating: 8,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Overview"),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Overview 121 0201 215 1 515 10 dnknfladkn anlknvgalknf alnl"),
                ),
                const SizedBox(
                  height: 100.0,
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

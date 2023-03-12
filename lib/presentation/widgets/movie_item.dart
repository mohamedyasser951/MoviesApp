import 'package:flutter/material.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/movie2.dart';
import 'package:movieapp/presentation/screen/details_screen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MovieItem extends StatelessWidget {
  final Results1 model;
  const MovieItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movieId: model.id!),
            ));
      },
      child: Container(
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
                          "https://image.tmdb.org/t/p/w500${model.posterPath}"))),
            ),
            const SizedBox(
              height: 6.0,
            ),
            SizedBox(
              width: 180,
              child: Text(
                model.title!,
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
                    model.voteAverage.toString(),
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
                    rating: model.voteAverage! / 2,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

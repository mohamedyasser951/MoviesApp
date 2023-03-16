import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/presentation/screen/details_screen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MovieItem extends StatelessWidget {
  final Results model;
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
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${model.posterPath}",
              imageBuilder: (context, imageProvider) => Container(
                height: 230,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const SizedBox(
                  height: 230,
                  width: 150,
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const SizedBox(
                  height: 230, child: Center(child: Icon(Icons.error))),
            ),
            const SizedBox(
              height: 6.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
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
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    double.parse((model.voteAverage).toStringAsFixed(1))
                        .toString(),
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

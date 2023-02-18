import 'package:flutter/material.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/screen/details_screen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class TopRateWidget extends StatelessWidget {
 final int index;
 const TopRateWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsScreen(movieId: cubit.topRateModel!.results![index].id!),
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
                          "https://image.tmdb.org/t/p/w500${cubit.topRateModel!.results![index].posterPath}"))),
            ),
            const SizedBox(
              height: 6.0,
            ),
            SizedBox(
              width: 180,
              child: Text(
                cubit.topRateModel!.results![index].title!,
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
                    cubit.topRateModel!.results![index].voteAverage.toString(),
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
                    rating:
                        cubit.topRateModel!.results![index].voteAverage! / 2,
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
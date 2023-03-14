import 'package:flutter/material.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieCubit.get(context).getTrendingPerson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(
            child: circleLoadingWidget(context),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 140,
            child: ListView.builder(
              itemCount: snapshot.data!.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${snapshot.data!.results![index].image}"))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.results![index].name!,
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
                        "Trending for ${snapshot.data!.results![index].known}",
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
        return const Center(
          child: Text("Something wrong"),
        );
      },
    );
  }
}

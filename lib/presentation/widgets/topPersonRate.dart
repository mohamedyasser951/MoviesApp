import 'package:flutter/material.dart';
import 'package:movieapp/businessLogic/cubit/cubit.dart';
import 'package:movieapp/component/styles/style.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    //  print(cubit.persons!.results.length);

    return Container(
      height: 130,
      child: ListView.builder(
        itemCount: cubit.trendPersonModel.results!.length,
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
                              "https://image.tmdb.org/t/p/w500${cubit.trendPersonModel.results![index].image}"))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.trendPersonModel.results![index].name!,
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
                  "Trending for ${cubit.trendPersonModel.results![index].known}",
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

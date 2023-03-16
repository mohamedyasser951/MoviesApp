import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/presentation/screen/details_screen.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';
import 'package:page_indicator/page_indicator.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainModel>(
      future: MovieCubit.get(context).getNowplaying(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 220,
            child: PageIndicatorContainer(
              padding: const EdgeInsets.all(5),
              align: IndicatorAlign.bottom,
              shape: IndicatorShape.circle(size: 5),
              length: snapshot.data!.results!.take(6).length,
              indicatorColor: CustomColors.bottomDarkBack,
              indicatorSelectorColor: CustomColors.thirdColor,
              child: PageView.builder(
                itemCount: snapshot.data!.results!.take(6).length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            movieId: snapshot.data!.results![index].id!),
                      ));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${snapshot.data!.results![index].posterPath!}")),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    CustomColors.scaffoldDarkBack
                                        .withOpacity(1.0),
                                    CustomColors.scaffoldDarkBack
                                        .withOpacity(0.0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [
                                    0.0,
                                    0.9,
                                  ])),
                        ),
                        Positioned(
                            bottom: 0,
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Icon(
                              FontAwesomeIcons.circlePlay,
                              size: 40.0,
                              color: CustomColors.secondaryColor,
                            )),
                        Positioned(
                            bottom: 30,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                snapshot.data!.results![index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: buildMovielistLoaderWidget(context),
          );
        }
        return const Text("Something error!");
      },
    );
  }
}

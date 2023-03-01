import 'package:flutter/widgets.dart';
import 'package:movieapp/presentation/widgets/topRatedMovie.dart';

class TopRatedMovieBuilder extends StatelessWidget {
  const TopRatedMovieBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TopRateWidget(
            index: index,
          );
        },
      ),
    );
  }
}

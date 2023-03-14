import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/SearchCubit/search_cubit.dart';
import 'package:movieapp/businessLogic/SearchCubit/search_state.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:movieapp/presentation/widgets/movie_item.dart';
import 'package:movieapp/presentation/widgets/movie_loader.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColors.bottomDarkBack,
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.bottomDarkBack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              EvaIcons.arrowIosBackOutline,
              color: Colors.white,
            )),
        title: SearchWidget(searchController: searchController),
      ),
      body: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is LoadingSearchState) {
            return  Center(
              child:  buildMovielistLoaderWidget(context),
            );
          }
          if (state is EmptySearchState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("No result to show !"),
                ],
              ),
            );
          } else if (state is ErorrSearchState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Oops, Something went Wrong !"),
                ],
              ),
            );
          } else if (state is SuccessSearchState) {
            return GridView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: state.model.results!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                    crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemBuilder: (context, index) =>
                    MovieItem(model: state.model.results![index]));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Search Now for Movies",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  EvaIcons.search,
                  size: 80,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextField(
        controller: searchController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                searchController.clear();
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.grey,
              ),
            ),
            hintText: "Search",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: CustomColors.thirdColor)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        autocorrect: true,
        onChanged: (val) {
          BlocProvider.of<SearchCubit>(context).search(movieName: val);
        },
      ),
    );
  }
}


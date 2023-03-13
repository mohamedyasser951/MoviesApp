import 'package:flutter/material.dart';
import 'package:movieapp/component/styles/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:movieapp/presentation/widgets/movie_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bottomDarkBack,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.bottomDarkBack,
        title: SizedBox(
          height: 50.0,
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            autocorrect: true,
            onChanged: (cal) {},
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                EvaIcons.close,
                color: Colors.white,
              ))
        ],
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
        itemBuilder: (context, index) => Container(
          height: 50,
          width: 50,
          color: Colors.amber,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_cubit.dart';
import 'package:movieapp/businessLogic/HomeCubit/home_states.dart';
import 'package:movieapp/data/apiservice/diohelper.dart';
import 'package:movieapp/component/block_observer.dart';
import 'package:movieapp/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieCubit()),
      ],
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: const HomeScreen());
        },
      ),
    );
  }
}

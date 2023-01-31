import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/ApiServices/ApiServices.dart';
import 'package:movieapp/layout/cubit/cubit.dart';
import 'package:movieapp/screen/homeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => MovieCubit()..getNowplaying()..getTrendingPerson()..getTopRate(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}

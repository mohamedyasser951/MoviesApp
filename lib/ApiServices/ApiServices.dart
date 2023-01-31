import 'package:dio/dio.dart';

class ApiService {
 
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjczOWU0NTdhODYyNzA1MThmZmI4NTE4NTRkNmY1OCIsInN1YiI6IjYzZDcwNDcyMTJiMTBlMDA4NTFjNGM1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mr4BFsCIKYU29M3t5I2ldf08WHqA0hxdiXg0y2pOK18";
  static String mainUrl = "https://api.themoviedb.org/3";

  static late Dio dio;

  static void init() {
     print("init run");
    dio = Dio(BaseOptions(baseUrl: mainUrl, receiveDataWhenStatusError: true,));
  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic> queryParmeters}) async {
    dio.options.headers;
    return await dio.get(
      url,
      queryParameters: queryParmeters,
    );
  }
}

import 'package:dio/dio.dart';

class ApiService {
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjczOWU0NTdhODYyNzA1MThmZmI4NTE4NTRkNmY1OCIsInN1YiI6IjYzZDcwNDcyMTJiMTBlMDA4NTFjNGM1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mr4BFsCIKYU29M3t5I2ldf08WHqA0hxdiXg0y2pOK18";
  static String mainUrl = "https://api.themoviedb.org/3";
  static String apiKey = "9b739e457a86270518ffb851854d6f58";

  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: mainUrl,
        receiveDataWhenStatusError: true,
        queryParameters: {"api_key": apiKey, "language": "en-US", "page": 1}));
  }

  static Future<Response> getData(
      {required String url}) async {
    return await dio.get(
      url,
    );
  }
}

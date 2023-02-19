class MovieDetailModel {
  bool? adult;
  int? budget;
  double? popularity;
  String? poster;
  String? releaseDate;
  String? status;
  String? tagline;
  String? overview;
  String? title;
  double? voteAverage;
  int? voteCount;
  int? revenue;

  MovieDetailModel.fromjson(Map<String, dynamic> json) {
    adult = json["adult"];
    budget = json["budget"];
    popularity = json["popularity"];
    poster= json["poster_path"];
    releaseDate= json["release_date"];
    status=json["status"];
    tagline=json["tagline"];
    overview=json["overview"];
    title=json["title"];
    voteAverage=json["vote_average"];
    voteCount=json["vote_count"];
    revenue =json["revenue"];
  }
}

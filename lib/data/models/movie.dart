class MovieModel {
  int? id;
  String? title;
  String? overview;
  String? backPoster;
  String? poster;
  double? popularity;
  String? releaseDate;
  dynamic rating;

  MovieModel(this.id, this.title, this.overview, this.poster, this.backPoster,
      this.popularity, this.releaseDate, this.rating);

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    overview = json["overview"];
    poster = json["poster_path"];
    backPoster = json["backdrop_path"];
    popularity = json["popularity"];
    releaseDate = json["release_date"];
    rating = json["vote_average"];
  }
}

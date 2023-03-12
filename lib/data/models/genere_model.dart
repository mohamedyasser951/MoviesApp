class GenreModel {
  List<Genres>? genres;

  GenreModel({this.genres});

  GenreModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add( Genres.fromJson(v));
      });
    }
  }

}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}
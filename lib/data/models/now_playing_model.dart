class NowPlayingModel {
  int? page;
  List<Results>? results;
  Dates? dates;
  int? totalPages;
  int? totalResults;

  NowPlayingModel(
      {this.page,
      this.results,
      this.dates,
      this.totalPages,
      this.totalResults});

  NowPlayingModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add( Results.fromJson(v));
      });
    }
    dates = json['dates'] != null ?  Dates.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Results {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  dynamic voteAverage;

  Results(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}























// class NowplayingModel {
//   List<MovieModel>? results = [];

//   NowplayingModel.fromJson(Map<dynamic, dynamic> json) {
//     if (json["results"] != null) {
//       (json["results"] as List).map((e) {
//         MovieModel.fromJson(e);
//       }).toList();
//     }
//   }
// }
//  results = (json["results"] as List).map((e){
//         Results.fromJson(e)
//       }).toList(),

// class Autogenerated {
//   int? page;
//   List<Results>? results;
//  // Dates? dates;
//   int? totalPages;
//   int? totalResults;

//   Autogenerated(
//       {this.page,
//       this.results,
//     //  this.dates,
//       this.totalPages,
//       this.totalResults});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     if (json['results'] != null) {
//       // results = <Results>[];
//       // json['results'].forEach((v) {
//       //   results!.add(new Results.fromJson(v));
//       // });
     
//     }
//     //dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
//     totalPages = json['total_pages'];
//     totalResults = json['total_results'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['page'] = this.page;
//   //   if (this.results != null) {
//   //     data['results'] = this.results!.map((v) => v.toJson()).toList();
//   //   }
//   //   if (this.dates != null) {
//   //     data['dates'] = this.dates!.toJson();
//   //   }
//   //   data['total_pages'] = this.totalPages;
//   //   data['total_results'] = this.totalResults;
//   //   return data;
//   // }
// }

// class Results {
//   String? posterPath;
//   bool? adult;
//   String? overview;
//   String? releaseDate;
//   List<int>? genreIds;
//   int? id;
//   String? originalTitle;
//   String? originalLanguage;
//   String? title;
//   String? backdropPath;
//   double? popularity;
//   int? voteCount;
//   bool? video;
//   double? voteAverage;

//   Results(
//       {this.posterPath,
//       this.adult,
//       this.overview,
//       this.releaseDate,
//       this.genreIds,
//       this.id,
//       this.originalTitle,
//       this.originalLanguage,
//       this.title,
//       this.backdropPath,
//       this.popularity,
//       this.voteCount,
//       this.video,
//       this.voteAverage});

//   Results.fromJson(Map<String, dynamic> json) {
//     posterPath = json['poster_path'];
//     adult = json['adult'];
//     overview = json['overview'];
//     releaseDate = json['release_date'];
//     genreIds = json['genre_ids'].cast<int>();
//     id = json['id'];
//     originalTitle = json['original_title'];
//     originalLanguage = json['original_language'];
//     title = json['title'];
//     backdropPath = json['backdrop_path'];
//     popularity = json['popularity'];
//     voteCount = json['vote_count'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//   }
  
// }

class TrendPersonModel {
  List<TrenPeopleResult>? results = [];

  TrendPersonModel.fromJson(Map<String, dynamic> json) {
    if (json["results"] != null) {
      json["results"].forEach((e) {
       
        results!.add(TrenPeopleResult.fromJson(e));
      });
    }
  }
}

class TrenPeopleResult {
  bool? adult;
  int? id;
  String? name;
  String? known;
  String? image;

  TrenPeopleResult.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    id = json["id"];
    name = json['name'];
    known = json["known_for_department"];
    image = json["profile_path"];
  }
}

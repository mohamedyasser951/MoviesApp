class GenereModel {
  List<GenereData>? genres;

  GenereModel.froJson(Map<String, dynamic> json) {
    genres = <GenereData>[];
    json["genres"].forEach((element) {
      genres!.add(GenereData.frmJson(element));
    });
  }
}

class GenereData {
  int? id;
  String? name;

  GenereData.frmJson(Map<String, dynamic> json) {
    if (json["genres"] != null) {
      id = json["id"];
      name = json["name"];
    }
  }
}

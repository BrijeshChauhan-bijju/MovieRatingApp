class SearchAll {
  String? searchType;
  String? expression;
  List<Results>? results;
  String? errorMessage;

  SearchAll({
      this.searchType, 
      this.expression, 
      this.results, 
      this.errorMessage});

  SearchAll.fromJson(dynamic json) {
    searchType = json["searchType"];
    expression = json["expression"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["searchType"] = searchType;
    map["expression"] = expression;
    if (results != null) {
      map["results"] = results?.map((v) => v.toJson()).toList();
    }
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Results {
  String? id;
  String? resultType;
  String? image;
  String? title;
  String? description;

  Results({
      this.id, 
      this.resultType, 
      this.image, 
      this.title, 
      this.description});

  Results.fromJson(dynamic json) {
    id = json["id"];
    resultType = json["resultType"];
    image = json["image"];
    title = json["title"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["resultType"] = resultType;
    map["image"] = image;
    map["title"] = title;
    map["description"] = description;
    return map;
  }

}
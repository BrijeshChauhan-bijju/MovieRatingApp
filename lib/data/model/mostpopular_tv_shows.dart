class MostpopularTvShows {
  List<Items>? items;
  String? errorMessage;

  MostpopularTvShows({
      this.items, 
      this.errorMessage});

  MostpopularTvShows.fromJson(dynamic json) {
    if (json["items"] != null) {
      items = [];
      json["items"].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (items != null) {
      map["items"] = items?.map((v) => v.toJson()).toList();
    }
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Items {
  String? id;
  String? rank;
  String? rankUpDown;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  Items({
      this.id, 
      this.rank, 
      this.rankUpDown, 
      this.title, 
      this.fullTitle, 
      this.year, 
      this.image, 
      this.crew, 
      this.imDbRating, 
      this.imDbRatingCount});

  Items.fromJson(dynamic json) {
    id = json["id"];
    rank = json["rank"];
    rankUpDown = json["rankUpDown"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    year = json["year"];
    image = json["image"];
    crew = json["crew"];
    imDbRating = json["imDbRating"];
    imDbRatingCount = json["imDbRatingCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["rank"] = rank;
    map["rankUpDown"] = rankUpDown;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["year"] = year;
    map["image"] = image;
    map["crew"] = crew;
    map["imDbRating"] = imDbRating;
    map["imDbRatingCount"] = imDbRatingCount;
    return map;
  }

}
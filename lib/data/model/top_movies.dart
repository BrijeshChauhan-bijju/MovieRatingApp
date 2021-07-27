
class TopMovies {
  List<TopMoviesItems>? items;
  String? errorMessage;

  TopMovies({
      this.items, 
      this.errorMessage});

  TopMovies.fromJson(dynamic json) {
    if (json["items"] != null) {
      items = [];
      json["items"].forEach((v) {
        items?.add(TopMoviesItems.fromJson(v));
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

class TopMoviesItems {
  String? id;
  String? rank;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  TopMoviesItems({
      this.id,
      this.rank,
      this.title,
      this.fullTitle,
      this.year,
      this.image,
      this.crew,
      this.imDbRating,
      this.imDbRatingCount});

  TopMoviesItems.fromJson(dynamic json) {
    id = json["id"];
    rank = json["rank"];
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
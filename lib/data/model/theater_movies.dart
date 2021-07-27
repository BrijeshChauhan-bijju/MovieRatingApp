class TheaterMovies {
  List<Items>? items;
  String? errorMessage;

  TheaterMovies({
      this.items, 
      this.errorMessage});

  TheaterMovies.fromJson(dynamic json) {
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
  String? title;
  String? fullTitle;
  String? year;
  String? releaseState;
  String? image;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingCount;
  String? metacriticRating;
  String? genres;
  List<GenreList>? genreList;
  String? directors;
  List<DirectorList>? directorList;
  String? stars;
  List<StarList>? starList;

  Items({
      this.id,
      this.title,
      this.fullTitle,
      this.year,
      this.releaseState,
      this.image,
      this.runtimeMins,
      this.runtimeStr,
      this.plot,
      this.contentRating,
      this.imDbRating,
      this.imDbRatingCount,
      this.metacriticRating,
      this.genres,
      this.genreList,
      this.directors,
      this.directorList,
      this.stars,
      this.starList});

  Items.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    year = json["year"];
    releaseState = json["releaseState"];
    image = json["image"];
    runtimeMins = json["runtimeMins"];
    runtimeStr = json["runtimeStr"];
    plot = json["plot"];
    contentRating = json["contentRating"];
    imDbRating = json["imDbRating"];
    imDbRatingCount = json["imDbRatingCount"];
    metacriticRating = json["metacriticRating"];
    genres = json["genres"];
    if (json["genreList"] != null) {
      genreList = [];
      json["genreList"].forEach((v) {
        genreList?.add(GenreList.fromJson(v));
      });
    }
    directors = json["directors"];
    if (json["directorList"] != null) {
      directorList = [];
      json["directorList"].forEach((v) {
        directorList?.add(DirectorList.fromJson(v));
      });
    }
    stars = json["stars"];
    if (json["starList"] != null) {
      starList = [];
      json["starList"].forEach((v) {
        starList?.add(StarList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["year"] = year;
    map["releaseState"] = releaseState;
    map["image"] = image;
    map["runtimeMins"] = runtimeMins;
    map["runtimeStr"] = runtimeStr;
    map["plot"] = plot;
    map["contentRating"] = contentRating;
    map["imDbRating"] = imDbRating;
    map["imDbRatingCount"] = imDbRatingCount;
    map["metacriticRating"] = metacriticRating;
    map["genres"] = genres;
    if (genreList != null) {
      map["genreList"] = genreList?.map((v) => v.toJson()).toList();
    }
    map["directors"] = directors;
    if (directorList != null) {
      map["directorList"] = directorList?.map((v) => v.toJson()).toList();
    }
    map["stars"] = stars;
    if (starList != null) {
      map["starList"] = starList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StarList {
  String? id;
  String? name;

  StarList({
      this.id, 
      this.name});

  StarList.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}

class DirectorList {
  String? id;
  String? name;

  DirectorList({
      this.id, 
      this.name});

  DirectorList.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}

class GenreList {
  String? key;
  String? value;

  GenreList({
      this.key, 
      this.value});

  GenreList.fromJson(dynamic json) {
    key = json["key"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["key"] = key;
    map["value"] = value;
    return map;
  }

}
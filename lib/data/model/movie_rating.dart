class MovieRating {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? imDb;
  String? metacritic;
  String? theMovieDb;
  String? rottenTomatoes;
  String? tVCom;
  String? filmAffinity;
  String? errorMessage;

  MovieRating({
      this.imDbId, 
      this.title, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.imDb, 
      this.metacritic, 
      this.theMovieDb, 
      this.rottenTomatoes, 
      this.tVCom, 
      this.filmAffinity, 
      this.errorMessage});

  MovieRating.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    imDb = json["imDb"];
    metacritic = json["metacritic"];
    theMovieDb = json["theMovieDb"];
    rottenTomatoes = json["rottenTomatoes"];
    tVCom = json["tV_com"];
    filmAffinity = json["filmAffinity"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imDbId"] = imDbId;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    map["imDb"] = imDb;
    map["metacritic"] = metacritic;
    map["theMovieDb"] = theMovieDb;
    map["rottenTomatoes"] = rottenTomatoes;
    map["tV_com"] = tVCom;
    map["filmAffinity"] = filmAffinity;
    map["errorMessage"] = errorMessage;
    return map;
  }

}
class MovieFullDetails {
  String? id;
  String? title;
  String? originalTitle;
  String? fullTitle;
  String? type;
  String? year;
  String? image;
  String? releaseDate;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? plotLocal;
  bool? plotLocalIsRtl;
  String? awards;
  String? directors;
  List<DirectorList>? directorList;
  String? writers;
  List<WriterList>? writerList;
  String? stars;
  List<StarList>? starList;
  List<ActorList>? actorList;
  dynamic? fullCast;
  String? genres;
  List<GenreList>? genreList;
  String? companies;
  List<CompanyList>? companyList;
  String? countries;
  List<CountryList>? countryList;
  String? languages;
  List<LanguageList>? languageList;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingVotes;
  String? metacriticRating;
  Ratings? ratings;
  Wikipedia? wikipedia;
  Posters? posters;
  Images? images;
  Trailer? trailer;
  BoxOffice? boxOffice;
  String? tagline;
  String? keywords;
  List<String>? keywordList;
  List<Similars>? similars;
  dynamic? tvSeriesInfo;
  dynamic? tvEpisodeInfo;
  String? errorMessage;

  MovieFullDetails({
      this.id, 
      this.title, 
      this.originalTitle, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.image, 
      this.releaseDate, 
      this.runtimeMins, 
      this.runtimeStr, 
      this.plot, 
      this.plotLocal, 
      this.plotLocalIsRtl, 
      this.awards, 
      this.directors, 
      this.directorList, 
      this.writers, 
      this.writerList, 
      this.stars, 
      this.starList, 
      this.actorList, 
      this.fullCast, 
      this.genres, 
      this.genreList, 
      this.companies, 
      this.companyList, 
      this.countries, 
      this.countryList, 
      this.languages, 
      this.languageList, 
      this.contentRating, 
      this.imDbRating, 
      this.imDbRatingVotes, 
      this.metacriticRating, 
      this.ratings, 
      this.wikipedia, 
      this.posters, 
      this.images, 
      this.trailer, 
      this.boxOffice, 
      this.tagline, 
      this.keywords, 
      this.keywordList, 
      this.similars, 
      this.tvSeriesInfo, 
      this.tvEpisodeInfo, 
      this.errorMessage});

  MovieFullDetails.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    originalTitle = json["originalTitle"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    image = json["image"];
    releaseDate = json["releaseDate"];
    runtimeMins = json["runtimeMins"];
    runtimeStr = json["runtimeStr"];
    plot = json["plot"];
    plotLocal = json["plotLocal"];
    plotLocalIsRtl = json["plotLocalIsRtl"];
    awards = json["awards"];
    directors = json["directors"];
    if (json["directorList"] != null) {
      directorList = [];
      json["directorList"].forEach((v) {
        directorList?.add(DirectorList.fromJson(v));
      });
    }
    writers = json["writers"];
    if (json["writerList"] != null) {
      writerList = [];
      json["writerList"].forEach((v) {
        writerList?.add(WriterList.fromJson(v));
      });
    }
    stars = json["stars"];
    if (json["starList"] != null) {
      starList = [];
      json["starList"].forEach((v) {
        starList?.add(StarList.fromJson(v));
      });
    }
    if (json["actorList"] != null) {
      actorList = [];
      json["actorList"].forEach((v) {
        actorList?.add(ActorList.fromJson(v));
      });
    }
    fullCast = json["fullCast"];
    genres = json["genres"];
    if (json["genreList"] != null) {
      genreList = [];
      json["genreList"].forEach((v) {
        genreList?.add(GenreList.fromJson(v));
      });
    }
    companies = json["companies"];
    if (json["companyList"] != null) {
      companyList = [];
      json["companyList"].forEach((v) {
        companyList?.add(CompanyList.fromJson(v));
      });
    }
    countries = json["countries"];
    if (json["countryList"] != null) {
      countryList = [];
      json["countryList"].forEach((v) {
        countryList?.add(CountryList.fromJson(v));
      });
    }
    languages = json["languages"];
    if (json["languageList"] != null) {
      languageList = [];
      json["languageList"].forEach((v) {
        languageList?.add(LanguageList.fromJson(v));
      });
    }
    contentRating = json["contentRating"];
    imDbRating = json["imDbRating"];
    imDbRatingVotes = json["imDbRatingVotes"];
    metacriticRating = json["metacriticRating"];
    ratings = json["ratings"] != null ? Ratings.fromJson(json["ratings"]) : null;
    wikipedia = json["wikipedia"] != null ? Wikipedia.fromJson(json["wikipedia"]) : null;
    posters = json["posters"] != null ? Posters.fromJson(json["posters"]) : null;
    images = json["images"] != null ? Images.fromJson(json["images"]) : null;
    trailer = json["trailer"] != null ? Trailer.fromJson(json["trailer"]) : null;
    boxOffice = json["boxOffice"] != null ? BoxOffice.fromJson(json["boxOffice"]) : null;
    tagline = json["tagline"];
    keywords = json["keywords"];
    keywordList = json["keywordList"] != null ? json["keywordList"].cast<String>() : [];
    if (json["similars"] != null) {
      similars = [];
      json["similars"].forEach((v) {
        similars?.add(Similars.fromJson(v));
      });
    }
    tvSeriesInfo = json["tvSeriesInfo"];
    tvEpisodeInfo = json["tvEpisodeInfo"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["originalTitle"] = originalTitle;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    map["image"] = image;
    map["releaseDate"] = releaseDate;
    map["runtimeMins"] = runtimeMins;
    map["runtimeStr"] = runtimeStr;
    map["plot"] = plot;
    map["plotLocal"] = plotLocal;
    map["plotLocalIsRtl"] = plotLocalIsRtl;
    map["awards"] = awards;
    map["directors"] = directors;
    if (directorList != null) {
      map["directorList"] = directorList?.map((v) => v.toJson()).toList();
    }
    map["writers"] = writers;
    if (writerList != null) {
      map["writerList"] = writerList?.map((v) => v.toJson()).toList();
    }
    map["stars"] = stars;
    if (starList != null) {
      map["starList"] = starList?.map((v) => v.toJson()).toList();
    }
    if (actorList != null) {
      map["actorList"] = actorList?.map((v) => v.toJson()).toList();
    }
    map["fullCast"] = fullCast;
    map["genres"] = genres;
    if (genreList != null) {
      map["genreList"] = genreList?.map((v) => v.toJson()).toList();
    }
    map["companies"] = companies;
    if (companyList != null) {
      map["companyList"] = companyList?.map((v) => v.toJson()).toList();
    }
    map["countries"] = countries;
    if (countryList != null) {
      map["countryList"] = countryList?.map((v) => v.toJson()).toList();
    }
    map["languages"] = languages;
    if (languageList != null) {
      map["languageList"] = languageList?.map((v) => v.toJson()).toList();
    }
    map["contentRating"] = contentRating;
    map["imDbRating"] = imDbRating;
    map["imDbRatingVotes"] = imDbRatingVotes;
    map["metacriticRating"] = metacriticRating;
    if (ratings != null) {
      map["ratings"] = ratings?.toJson();
    }
    if (wikipedia != null) {
      map["wikipedia"] = wikipedia?.toJson();
    }
    if (posters != null) {
      map["posters"] = posters?.toJson();
    }
    if (images != null) {
      map["images"] = images?.toJson();
    }
    if (trailer != null) {
      map["trailer"] = trailer?.toJson();
    }
    if (boxOffice != null) {
      map["boxOffice"] = boxOffice?.toJson();
    }
    map["tagline"] = tagline;
    map["keywords"] = keywords;
    map["keywordList"] = keywordList;
    if (similars != null) {
      map["similars"] = similars?.map((v) => v.toJson()).toList();
    }
    map["tvSeriesInfo"] = tvSeriesInfo;
    map["tvEpisodeInfo"] = tvEpisodeInfo;
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Similars {
  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? plot;
  String? directors;
  String? stars;
  String? genres;
  String? imDbRating;

  Similars({
      this.id, 
      this.title, 
      this.fullTitle, 
      this.year, 
      this.image, 
      this.plot, 
      this.directors, 
      this.stars, 
      this.genres, 
      this.imDbRating});

  Similars.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    year = json["year"];
    image = json["image"];
    plot = json["plot"];
    directors = json["directors"];
    stars = json["stars"];
    genres = json["genres"];
    imDbRating = json["imDbRating"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["year"] = year;
    map["image"] = image;
    map["plot"] = plot;
    map["directors"] = directors;
    map["stars"] = stars;
    map["genres"] = genres;
    map["imDbRating"] = imDbRating;
    return map;
  }

}

class BoxOffice {
  String? budget;
  String? openingWeekendUSA;
  String? grossUSA;
  String? cumulativeWorldwideGross;

  BoxOffice({
      this.budget, 
      this.openingWeekendUSA, 
      this.grossUSA, 
      this.cumulativeWorldwideGross});

  BoxOffice.fromJson(dynamic json) {
    budget = json["budget"];
    openingWeekendUSA = json["openingWeekendUSA"];
    grossUSA = json["grossUSA"];
    cumulativeWorldwideGross = json["cumulativeWorldwideGross"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["budget"] = budget;
    map["openingWeekendUSA"] = openingWeekendUSA;
    map["grossUSA"] = grossUSA;
    map["cumulativeWorldwideGross"] = cumulativeWorldwideGross;
    return map;
  }

}

class Trailer {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? videoId;
  String? videoTitle;
  String? videoDescription;
  String? thumbnailUrl;
  String? uploadDate;
  String? link;
  String? linkEmbed;
  String? errorMessage;

  Trailer({
      this.imDbId, 
      this.title, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.videoId, 
      this.videoTitle, 
      this.videoDescription, 
      this.thumbnailUrl, 
      this.uploadDate, 
      this.link, 
      this.linkEmbed, 
      this.errorMessage});

  Trailer.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    videoId = json["videoId"];
    videoTitle = json["videoTitle"];
    videoDescription = json["videoDescription"];
    thumbnailUrl = json["thumbnailUrl"];
    uploadDate = json["uploadDate"];
    link = json["link"];
    linkEmbed = json["linkEmbed"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imDbId"] = imDbId;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    map["videoId"] = videoId;
    map["videoTitle"] = videoTitle;
    map["videoDescription"] = videoDescription;
    map["thumbnailUrl"] = thumbnailUrl;
    map["uploadDate"] = uploadDate;
    map["link"] = link;
    map["linkEmbed"] = linkEmbed;
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Images {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<Itemss>? items;
  String? errorMessage;

  Images({
      this.imDbId,
      this.title,
      this.fullTitle,
      this.type,
      this.year,
      this.items,
      this.errorMessage});

  Images.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    if (json["items"] != null) {
      items = [];
      json["items"].forEach((v) {
        items?.add(Itemss.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imDbId"] = imDbId;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    if (items != null) {
      map["items"] = items?.map((v) => v.toJson()).toList();
    }
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Itemss {
  String? title;
  String? image;

  Itemss({
      this.title,
      this.image});

  Itemss.fromJson(dynamic json) {
    title = json["title"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["image"] = image;
    return map;
  }

}

class Posters {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<Posterss>? posters;
  List<Backdrops>? backdrops;
  String? errorMessage;

  Posters({
      this.imDbId, 
      this.title, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.posters, 
      this.backdrops, 
      this.errorMessage});

  Posters.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    if (json["posters"] != null) {
      posters = [];
      json["posters"].forEach((v) {
        posters?.add(Posterss.fromJson(v));
      });
    }
    if (json["backdrops"] != null) {
      backdrops = [];
      json["backdrops"].forEach((v) {
        backdrops?.add(Backdrops.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imDbId"] = imDbId;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    if (posters != null) {
      map["posters"] = posters?.map((v) => v.toJson()).toList();
    }
    if (backdrops != null) {
      map["backdrops"] = backdrops?.map((v) => v.toJson()).toList();
    }
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class Backdrops {
  String? id;
  String? link;
  double? aspectRatio;
  String? language;
  int? width;
  int? height;

  Backdrops({
      this.id, 
      this.link, 
      this.aspectRatio, 
      this.language, 
      this.width, 
      this.height});

  Backdrops.fromJson(dynamic json) {
    id = json["id"];
    link = json["link"];
    aspectRatio = json["aspectRatio"];
    language = json["language"];
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["link"] = link;
    map["aspectRatio"] = aspectRatio;
    map["language"] = language;
    map["width"] = width;
    map["height"] = height;
    return map;
  }

}

class Posterss {
  String? id;
  String? link;
  double? aspectRatio;
  String? language;
  int? width;
  int? height;

  Posterss({
      this.id, 
      this.link, 
      this.aspectRatio, 
      this.language, 
      this.width, 
      this.height});

  Posterss.fromJson(dynamic json) {
    id = json["id"];
    link = json["link"];
    aspectRatio = json["aspectRatio"];
    language = json["language"];
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["link"] = link;
    map["aspectRatio"] = aspectRatio;
    map["language"] = language;
    map["width"] = width;
    map["height"] = height;
    return map;
  }

}

class Wikipedia {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? language;
  String? titleInLanguage;
  String? url;
  PlotShort? plotShort;
  PlotFull? plotFull;
  String? errorMessage;

  Wikipedia({
      this.imDbId, 
      this.title, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.language, 
      this.titleInLanguage, 
      this.url, 
      this.plotShort, 
      this.plotFull, 
      this.errorMessage});

  Wikipedia.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    language = json["language"];
    titleInLanguage = json["titleInLanguage"];
    url = json["url"];
    plotShort = json["plotShort"] != null ? PlotShort.fromJson(json["plotShort"]) : null;
    plotFull = json["plotFull"] != null ? PlotFull.fromJson(json["plotFull"]) : null;
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imDbId"] = imDbId;
    map["title"] = title;
    map["fullTitle"] = fullTitle;
    map["type"] = type;
    map["year"] = year;
    map["language"] = language;
    map["titleInLanguage"] = titleInLanguage;
    map["url"] = url;
    if (plotShort != null) {
      map["plotShort"] = plotShort?.toJson();
    }
    if (plotFull != null) {
      map["plotFull"] = plotFull?.toJson();
    }
    map["errorMessage"] = errorMessage;
    return map;
  }

}

class PlotFull {
  String? plainText;
  String? html;

  PlotFull({
      this.plainText, 
      this.html});

  PlotFull.fromJson(dynamic json) {
    plainText = json["plainText"];
    html = json["html"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["plainText"] = plainText;
    map["html"] = html;
    return map;
  }

}

class PlotShort {
  String? plainText;
  String? html;

  PlotShort({
      this.plainText, 
      this.html});

  PlotShort.fromJson(dynamic json) {
    plainText = json["plainText"];
    html = json["html"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["plainText"] = plainText;
    map["html"] = html;
    return map;
  }

}

class Ratings {
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

  Ratings({
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

  Ratings.fromJson(dynamic json) {
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

class LanguageList {
  String? key;
  String? value;

  LanguageList({
      this.key, 
      this.value});

  LanguageList.fromJson(dynamic json) {
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

class CountryList {
  String? key;
  String? value;

  CountryList({
      this.key, 
      this.value});

  CountryList.fromJson(dynamic json) {
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

class CompanyList {
  String? id;
  String? name;

  CompanyList({
      this.id, 
      this.name});

  CompanyList.fromJson(dynamic json) {
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

class ActorList {
  String? id;
  String? image;
  String? name;
  String? asCharacter;

  ActorList({
      this.id, 
      this.image, 
      this.name, 
      this.asCharacter});

  ActorList.fromJson(dynamic json) {
    id = json["id"];
    image = json["image"];
    name = json["name"];
    asCharacter = json["asCharacter"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["image"] = image;
    map["name"] = name;
    map["asCharacter"] = asCharacter;
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

class WriterList {
  String? id;
  String? name;

  WriterList({
      this.id, 
      this.name});

  WriterList.fromJson(dynamic json) {
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
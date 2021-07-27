class MovieWikipedia {
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

  MovieWikipedia({
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

  MovieWikipedia.fromJson(dynamic json) {
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
class Youtubetrailer {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? videoId;
  String? videoUrl;
  String? errorMessage;

  Youtubetrailer({
      this.imDbId, 
      this.title, 
      this.fullTitle, 
      this.type, 
      this.year, 
      this.videoId, 
      this.videoUrl, 
      this.errorMessage});

  Youtubetrailer.fromJson(dynamic json) {
    imDbId = json["imDbId"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    type = json["type"];
    year = json["year"];
    videoId = json["videoId"];
    videoUrl = json["videoUrl"];
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
    map["videoUrl"] = videoUrl;
    map["errorMessage"] = errorMessage;
    return map;
  }

}
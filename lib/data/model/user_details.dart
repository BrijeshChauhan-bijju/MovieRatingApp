class UserDetails {
  String? username;
  String? email;
  String? mobilenumber;
  String? password;
  String? image;

  UserDetails(
      {this.username,
      this.email,
      this.mobilenumber,
      this.image,
      this.password});

  UserDetails.fromJson(dynamic json) {
    username = json["username"];
    email = json["email"];
    mobilenumber = json["mobilenumber"];
    image = json["image"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = username;
    map["email"] = email;
    map["mobilenumber"] = mobilenumber;
    map["image"] = image;
    map["password"] = password;
    return map;
  }
}

import 'package:flutter/cupertino.dart';
class APIs {
  APIs._();

  // Base url

  static const String baseUrl = "https://imdb-api.com/en/API";
  static const String apikey = "k_n0of3yma";

  // chauhanbijju22@gmail.com : k_j1y206r6
  // brijeshchauhan7895@gmail.com : k_qd9r34f0
  // brijesh.chauhan@neosoftmail.com : k_q4u6qwt4
  // laxmanrawat024@gmail.com : k_n0of3yma
  //  k_kez41nvt

  //new App Url
  static const String intheatermovie = "$baseUrl/InTheaters/$apikey";
  static const String mostpopularmovie = "$baseUrl/MostPopularMovies/$apikey";
  static const String topmovie = "$baseUrl/Top250Movies/$apikey";
  static const String youtubetrailer = "$baseUrl/YouTubeTrailer/$apikey/";
  static const String movierating = "$baseUrl/Ratings/$apikey/";
  static const String moviewikipedia = "$baseUrl/Wikipedia/$apikey/";
  static const String moviefulldetails = "$baseUrl/Title/$apikey/";
  static const String searchall = "$baseUrl/SearchTitle/$apikey/";

  static late BuildContext context;
}

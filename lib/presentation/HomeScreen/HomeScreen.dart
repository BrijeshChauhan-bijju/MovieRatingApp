import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/data/model/top_movies.dart';
import 'package:imdbmovieapp/data/widget/ImageSlider/ImageSlider.dart';
import 'package:imdbmovieapp/presentation/HomeScreen/HomeScreenProvider.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/presentation/SearchScreen/SearchScreen.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeScreenProvider provider;

  @override
  void initState() {
    super.initState();
    fetchData(false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeScreenProvider>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: provider.isloading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : buildhomescreen(provider.theatermovies, provider.topMovies,
                provider.mostPopularMovies));
  }

  buildhomescreen(TheaterMovies theatermovies, TopMovies topMovies,
      MostPopularMovies mostPopularMovies) {
    if (theatermovies.items != null && theatermovies.items!.length > 0) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: ImageSlider(theatermovies),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/imdb.png',
                          height: 60,
                          width: 80,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()));
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  text: "TV Shows",
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      fetchData(true);
                                    },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          Spacer(),
                          RichText(
                              text: TextSpan(
                                  text: "Movies",
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      fetchData(false);
                                    },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          Spacer(),
                          RichText(
                              text: TextSpan(
                                  text: "My List",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                provider.tvshowsdisplay ? "Popular TvShows" : "Popular Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: mostPopularMovies.items!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => RatingDetailsScreen(
                                mostPopularMovies.items![index])),
                      );
                    },
                    child: new Container(
                      width: 120,
                      height: 180,
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      child: getCachedNetworkImage(
                          url: mostPopularMovies.items![index].image!,
                          fit: BoxFit.cover),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                provider.tvshowsdisplay ? "Top 250 TvShows" : "Top 250 Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: topMovies.items!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        PopularItems popularitem = PopularItems();
                        popularitem.title = topMovies.items![index].title!;
                        popularitem.image = topMovies.items![index].image!;
                        popularitem.fullTitle =
                            topMovies.items![index].fullTitle!;
                        popularitem.year = topMovies.items![index].year!;
                        popularitem.id = topMovies.items![index].id!;
                        popularitem.imDbRating =
                            topMovies.items![index].imDbRating!;
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    RatingDetailsScreen(popularitem)));
                      },
                      child: new Container(
                        width: 120,
                        height: 180,
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 10),
                        child: Stack(
                          children: <Widget>[
                            getCachedNetworkImage(
                                url: topMovies.items![index].image!,
                                fit: BoxFit.cover),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black26,
                                        Color.fromRGBO(101, 177, 124, 1)
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Text(
                                    topMovies.items![index].imDbRating!,
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  )),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        )),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            theatermovies.errorMessage!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void fetchData(bool istvshows) {
    Future.delayed(Duration(milliseconds: 300), () {
      provider.setloading(true);
      provider.gettheatermovielist(istvshows);
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';

class ImageSlider extends StatefulWidget {
  TheaterMovies theatermovies;

  ImageSlider(this.theatermovies);

  @override
  ImageSliderState createState() => ImageSliderState(theatermovies);
}

class ImageSliderState extends State<ImageSlider> {
  final CarouselController _controller = CarouselController();
  TheaterMovies theatermovies;
  var imgList;

  ImageSliderState(this.theatermovies) {
    imgList = theatermovies.items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(

            items: theatermovies.items!
                .map((item) =>
                Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        PopularItems popularitem = PopularItems();
                        popularitem.title=item.title;
                        popularitem.image=item.image;
                        popularitem.fullTitle=item.fullTitle;
                        popularitem.year=item.year;
                        popularitem.id=item.id;
                        popularitem.imDbRating=item.imDbRating;
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  RatingDetailsScreen(popularitem)),
                        );
                      },
                      child: getCachedNetworkImage(
                        url: item.image!, fit: BoxFit.cover, height: MediaQuery
                          .of(context)
                          .size
                          .height, width: MediaQuery
                          .of(context)
                          .size
                          .width,),
                    ),
                    // Image.network(item.image!, fit: BoxFit.cover,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
                    Positioned(
                      bottom: 40.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${item.title!}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${item.genres!}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

            )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                }),
          ),
        ),
      ]),
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/Youtubetrailer.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/movie_full_details.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:imdbmovieapp/data/widget/VideoPlayer/VideoPlayer.dart';
import 'package:imdbmovieapp/data/widget/ratingBar.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:provider/provider.dart';

class RatingDetailsScreen extends StatefulWidget {
  PopularItems movieitem;

  RatingDetailsScreen(this.movieitem);

  @override
  RatingDetailsScreenState createState() => RatingDetailsScreenState();
}

class RatingDetailsScreenState extends State<RatingDetailsScreen>
    with TickerProviderStateMixin {
  late RatingDetailScreenProvider provider;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<RatingDetailScreenProvider>(context);
    return MaterialApp(
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home: provider.isloading
            ? Center(
                child: CircularProgressIndicator(color:AppColors.primaryColor),
              )
            : buildratingdetailscreen(
                provider.movieFullDetails, provider.youtubetrailer, context));
  }

  Widget buildratingdetailscreen(MovieFullDetails movieFullDetails,
      Youtubetrailer youtubetrailer, BuildContext context) {
    if (movieFullDetails != null) {
      return Scaffold(
          backgroundColor: Colors.black,
          bottomSheet: showbottomsheet(context, movieFullDetails, provider),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: VideoPlayerWidget(
                        videoUrl: youtubetrailer.videoId,
                        thumbNail: '',
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 30,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(movieFullDetails.image!))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Text(
                            movieFullDetails.title!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 150,
                              child: RatingBarWidget(),
                            ),
                            Container(
                              height: 40,
                              child: Text(
                                movieFullDetails.imDbRating!.isEmpty
                                    ? "0"
                                    : movieFullDetails.imDbRating!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // Spacer(),
                    IconButton(
                        onPressed: () {
                          sharelink(movieFullDetails.trailer!.link!);
                        },
                        icon: Icon(
                          Icons.share,
                          color: Colors.grey,
                        )),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: provider.favoritecolor,
                      ),
                      onPressed: () {
                        provider.setfavoritebutton(provider.favoritecolor);
                      },
                    ),
                    Spacer()
                  ],
                ),
                Container(
                    // height: 100,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Title : ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                           Spacer(),
                            Expanded(
                              child: Text(
                                "${movieFullDetails.title!}",
                                textAlign: TextAlign.left,
                                // maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Year : ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            Expanded(child: Text(
                              "${movieFullDetails.year}",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Type : ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            Expanded(child: Text(
                              "${movieFullDetails.type}",
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ));
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            movieFullDetails.errorMessage!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void fetchData() {
    Future.delayed(Duration(milliseconds: 300), () {
      provider.setloading(true);
      provider.getyoutubetrailer(widget.movieitem.id!);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


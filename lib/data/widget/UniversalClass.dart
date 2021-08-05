import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imdbmovieapp/data/model/movie_full_details.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreenProvider.dart';
import 'package:share/share.dart';

getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  } else if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

//cached Network image
Widget getCachedNetworkImage(
    {@required String? url, BoxFit? fit, height, width}) {
  return new CachedNetworkImage(
    width: width ?? double.infinity,
    height: height ?? double.infinity,
    imageUrl: url!,
    matchTextDirection: true,
    fit: fit,
    placeholder: (context, String val) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
        ),
        child: new Center(
          child: new CupertinoActivityIndicator(),
        ),
      );
    },
    errorWidget: (context, url, error) {
      return new Center(
          child: Icon(
        Icons.image,
        color: Colors.grey,
        size: 36.0,
      ));
    },
  );
}

sharelink(String url) {
  return Share.share(url);
}

showtoast(String message){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

showbottomsheet(
  BuildContext context,
  MovieFullDetails movieFullDetails,
  RatingDetailScreenProvider provider,
) {
  String firstHalf;
  String secondHalf;
  if (movieFullDetails.plot!.length > 150) {
    firstHalf = movieFullDetails.plot!.substring(0, 150);
    secondHalf =
        movieFullDetails.plot!.substring(150, movieFullDetails.plot!.length);
  } else {
    firstHalf = movieFullDetails.plot!;
    secondHalf = "";
  }
  return new Container(
    height: 280.0,
    color: Colors.black, //could change this to Color(0xFF737373),
    child: new Container(
        height: 280.0,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 0, right: 20),
        decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "${movieFullDetails.title}-Movie Review",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: secondHalf.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "${movieFullDetails.plot!}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    : new Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              provider.flag
                                  ? (firstHalf + "...")
                                  : (firstHalf + secondHalf),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          new InkWell(
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  provider.flag ? "Read more" : "Read less",
                                  style: new TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            onTap: () {
                              provider.setflag(provider.flag);
                            },
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text("CAST",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: movieFullDetails.actorList?.length!,
                    itemCount: 10,
                    itemBuilder:(BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                        },
                        child:Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            new Container(
                              width: 120,
                              height: 180,
                              margin:
                              EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),
                              child: getCachedNetworkImage(
                                  url: movieFullDetails.actorList?[index].image!,
                                  fit: BoxFit.cover),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                            ), new Container(
                              width: 120,
                              height: 40,
                              margin:
                              EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),
                              padding: EdgeInsets.only(top: movieFullDetails.actorList![index].name!.length>13?0:10),
                              child: Text(
                                  movieFullDetails.actorList![index].name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,

                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        )),
  );
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/coming_soon.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:imdbmovieapp/presentation/ComingSoonScreen/ComingSoonProvider.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/presentation/SearchScreen/SearchScreen.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:provider/provider.dart';

class ComingSoonScreen extends StatefulWidget {
  @override
  ComingSoonScreenState createState() => ComingSoonScreenState();
}

class ComingSoonScreenState extends State<ComingSoonScreen> {
  late ComingSoonProvider provider;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ComingSoonProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: provider.isloading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : buildwidget(provider.comingsoon),
        ));
  }

  buildwidget(ComingSoon comingsoon) {
    if (comingsoon.items != null && comingsoon.items!.length > 0) {
      return Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Coming Soon",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
          ),
          Expanded(
              child: ListView.builder(
            itemCount: comingsoon.items!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  PopularItems popularitem = PopularItems();
                  popularitem.title = comingsoon.items![index].title!;
                  popularitem.image = comingsoon.items![index].image!;
                  popularitem.fullTitle =
                  comingsoon.items![index].fullTitle!;
                  popularitem.year = comingsoon.items![index].year!;
                  popularitem.id = comingsoon.items![index].id!;
                  popularitem.imDbRating =
                  comingsoon.items![index].imDbRating!;
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              RatingDetailsScreen(popularitem)));
                },
                child: Column(
                  children: [
                    getCachedNetworkImage(
                        url: comingsoon.items![index].image,
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: MediaQuery.of(context).size.width),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            'Coming on ${comingsoon.items![index].releaseState!}',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            '${comingsoon.items![index].runtimeStr!}',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        comingsoon.items![index].fullTitle!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        comingsoon.items![index].plot!,
                        style: TextStyle(
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text(
                        comingsoon.items![index].genres!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            comingsoon.errorMessage!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void fetchData() {
    Future.delayed(Duration(milliseconds: 300), () {
      provider.getcomingsoonlist();
    });
  }
}

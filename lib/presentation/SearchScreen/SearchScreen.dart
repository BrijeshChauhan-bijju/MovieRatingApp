import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/search_all.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/data/model/top_movies.dart';
import 'package:imdbmovieapp/data/widget/ImageSlider/ImageSlider.dart';
import 'package:imdbmovieapp/presentation/HomeScreen/HomeScreenProvider.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/presentation/SearchScreen/SearchScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late SearchScreenProvider _searchScreenProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchScreenProvider = Provider.of<SearchScreenProvider>(context);

    return MaterialApp(
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle),
                child: Row(
                  // alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    Expanded(
                        child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Search for a show,movie,genre...',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          contentPadding: EdgeInsets.only(left: 20, right: 20)),
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {
                        _searchScreenProvider.getsearchresult(value);
                      },
                      validator: (value) {},
                    )),
                    Visibility(
                      visible: _searchScreenProvider.isloading,
                      child: SizedBox(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                        height: 20.0,
                        width: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              _searchScreenProvider.isloading
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text(
                        "Top Searches",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
              _searchScreenProvider.isloading
                  ? Container()
                  : buildlistview(_searchScreenProvider.searchAll),
            ],
          ),
        ));
  }

  buildlistview(SearchAll _searchall) {
    if (_searchall.results != null && _searchall.results!.length > 0) {
      return Expanded(
        // height: 180,
        // width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _searchall.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  PopularItems popularitem = PopularItems();
                  popularitem.title = _searchall.results![index].title!;
                  // popularitem.image = _searchall.results![index].image!;
                  popularitem.fullTitle = _searchall.results![index].title!;
                  popularitem.id = _searchall.results![index].id!;
                  if (_searchall.results![index].resultType
                          .toString()
                          .compareTo("Title") ==
                      0) {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              RatingDetailsScreen(popularitem)),
                    );
                  }
                },
                child: Container(
                  color: Colors.grey.shade800,
                  padding: EdgeInsets.only(right: 10),
                  margin: EdgeInsets.only(top: 5, left: 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: _searchall.results![index].image!.isNotEmpty
                            ? getCachedNetworkImage(
                                url: _searchall.results![index].image,
                                height: 80.0,
                                width: 150.0,
                                fit: BoxFit.cover)
                            : Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          _searchall.results![index].title! +
                              _searchall.results![index].description!,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // Spacer(),
                      _searchall.results![index].resultType
                                  .toString()
                                  .compareTo("Title") ==
                              0
                          ? Icon(
                              Icons.play_circle_outline_outlined,
                              color: Colors.white,
                              size: 30,
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            }),
      );
    } else {
      return Container();
    }
  }
}

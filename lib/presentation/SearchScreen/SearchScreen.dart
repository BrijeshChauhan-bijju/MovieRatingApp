import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/search_all.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/presentation/SearchScreen/SearchScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late SearchScreenProvider _searchScreenProvider;
  late stt.SpeechToText _speech;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    _searchScreenProvider = Provider.of<SearchScreenProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
            child: MaterialApp(
                color: Colors.black,
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: Colors.black,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                            Expanded(
                                child: TextFormField(
                              controller:
                                  _searchScreenProvider.searchcontroller,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintText: 'Search for a show,movie....',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  contentPadding:
                                      EdgeInsets.only(left: 20, right: 20)),
                              onFieldSubmitted: (value) {
                                _searchScreenProvider.getsearchresult(value);
                              },
                            )),
                            Stack(
                              children: [
                                _searchScreenProvider.isloading
                                    ? Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: CircularProgressIndicator(
                                            color: AppColors.primaryColor),
                                        height: 20.0,
                                        width: 20.0,
                                      )
                                    : IconButton(
                                        onPressed: _listen,
                                        icon: Icon(
                                          _searchScreenProvider.islistening
                                              ? Icons.mic
                                              : Icons.mic_none,
                                          color: Colors.white,
                                        ),
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                      _searchScreenProvider.isloading
                          ? Container()
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
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
                ))));
  }

  buildlistview(SearchAll _searchall) {
    if (_searchall.results != null && _searchall.results!.length > 0) {
      return Expanded(
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

  void _listen() async {
    if (!_searchScreenProvider.islistening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        _searchScreenProvider.setvoicelistening(true);
        _speech.listen(
          onResult: (val) {
            _searchScreenProvider.setcontrollervalue(val.recognizedWords);
            if (val.finalResult) {
              _searchScreenProvider.setvoicelistening(false);
              _speech.stop();
              _searchScreenProvider.getsearchresult(val.recognizedWords);
            }
          },
        );
      }
    }
  }

  void fetchData() {
    _speech = stt.SpeechToText();
  }
}

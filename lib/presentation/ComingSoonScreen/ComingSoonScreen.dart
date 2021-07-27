import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/data/model/top_movies.dart';
import 'package:imdbmovieapp/data/widget/ImageSlider/ImageSlider.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreen.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:provider/provider.dart';

class ComingSoonScreen extends StatefulWidget {
  @override
  ComingSoonScreenState createState() => ComingSoonScreenState();
}

class ComingSoonScreenState extends State<ComingSoonScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Text("Work in progress",style: TextStyle(
                color: Colors.white
            ),),
          ),
        ));
  }
}

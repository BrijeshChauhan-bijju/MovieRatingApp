import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatefulWidget {
  RatingBarWidget();

  @override
  RatingBarWidgetState createState() => RatingBarWidgetState();
}

class RatingBarWidgetState extends State<RatingBarWidget> {

  RatingBarWidgetState(){
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
     body: RatingBarIndicator(
       rating:5,
       // minRating: 1,
       direction: Axis.horizontal,
       // allowHalfRating: true,
       itemCount: 5,
       itemSize: 20,
       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
       itemBuilder: (context, _) => Icon(
         Icons.star,
         size: 5,
         color: Colors.amber,
       ),
     ),
   );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatefulWidget {
  @override
  DownloadsScreenState createState() => DownloadsScreenState();
}

class DownloadsScreenState extends State<DownloadsScreen> {

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

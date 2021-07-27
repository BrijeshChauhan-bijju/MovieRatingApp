import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigatonBarProvider.dart';
import 'package:imdbmovieapp/presentation/ComingSoonScreen/ComingSoonScreen.dart';
import 'package:imdbmovieapp/presentation/Downloads/DownloadsScreen.dart';
import 'package:imdbmovieapp/presentation/HomeScreen/HomeScreen.dart';
import 'package:provider/provider.dart';

class BottomNavigationbarScreen extends StatefulWidget {
  static const String TAG = "/BottomNavigationbarScreen";

  BottomNavigationbarScreenState createState() => BottomNavigationbarScreenState();
}

class BottomNavigationbarScreenState extends State<BottomNavigationbarScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:SafeArea(
            child: Scaffold(
              body: getPage(provider.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.currentIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor:  Colors.white,
                onTap: (index) {
                  provider.setcurrentIndex=index;
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      size: 20,
                      color: provider.currentIndex == 0
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.play_circle_filled,
                      size: 20,
                      color: provider.currentIndex == 1
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Coming Soon",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.downloading_rounded,
                      size: 20,
                      color: provider.currentIndex == 2
                          ? Colors.white
                          : Colors.grey,
                    ),
                    label: "Downloads",
                  ),
                ],
              ),
            ),
          ),
        );
  }


  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ComingSoonScreen();
      case 2:
        return DownloadsScreen();
      default:
        return HomeScreen();
    }
  }
  
}

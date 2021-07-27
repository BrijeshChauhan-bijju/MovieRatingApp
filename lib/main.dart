import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigatonBarProvider.dart';
import 'package:imdbmovieapp/presentation/HomeScreen/HomeScreenProvider.dart';
import 'package:imdbmovieapp/presentation/LoginScreen/Loginscreenprovider.dart';
import 'package:imdbmovieapp/presentation/LoginScreen/loginScreen.dart';
import 'package:imdbmovieapp/presentation/RatingDetailsScreen/RatingDetailsScreenProvider.dart';
import 'package:imdbmovieapp/presentation/RegisterScreen/RegisterScreen.dart';
import 'package:imdbmovieapp/presentation/RegisterScreen/RegisterScreenProvider.dart';
import 'package:imdbmovieapp/presentation/SearchScreen/SearchScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:provider/provider.dart';

void main() async {
  //for check life cycle
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    // setupServiceLocator();
    runApp(
      MultiProvider(providers: [
        // Provider<Flavor>.value(value: Flavor.dev),
        ChangeNotifierProvider<LoginScreenProvider>(
          create: (context) => LoginScreenProvider(),
        ),
        ChangeNotifierProvider<RegisterScreenProvider>(
          create: (context) => RegisterScreenProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider<RatingDetailScreenProvider>(
          create: (context) => RatingDetailScreenProvider(),
        ), ChangeNotifierProvider<SearchScreenProvider>(
          create: (context) => SearchScreenProvider(),
        ),
      ], child: IMDBMovie()),
    );
  });
}

class IMDBMovie extends StatefulWidget {
  IMDBMovie();

  IMDBMovieState createState() => IMDBMovieState();
}

class IMDBMovieState extends State<IMDBMovie> {
  IMDBMovieState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: AppColors.primaryColor,

          // Define the default font family.
          fontFamily: 'Georgia',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => RegisterScreen()
        });
  }
}

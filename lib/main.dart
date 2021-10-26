import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/repository/cached_data.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'dart:io';

import 'package:fuel_sale_app/screens/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }

  Future checkLoginStatus() async {
    prefs = await SharedPreferences.getInstance();
    _userdata = (prefs.getBool('isLoggedIn') ?? false);
    if (_userdata==true) {
      replaceScreen(context, HomePage());
    }else{
     changeScreen(context, LandingPage());
    }
  }

  bool? _userdata;

  late SharedPreferences prefs;
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }
}

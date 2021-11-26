import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_fifth_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_second_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_first_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_fourth_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_third_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Position position;
  var _token;

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _token = (userdata.getString("token"));
    });
  }

  void getLocation() async {
    Position res = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      position = res;
    });
  }

  @override
  void initState() {
    initUserData();
    getLocation();
    super.initState();
  }

  int _currentIndex = 0;
  _getWidget() {
    if (_currentIndex == 0) {
      return BottomNavigationBarFirstScreen(
        token: _token,
      );
    } else if (_currentIndex == 1) {
      return BottomNavigationBarSecondScreen(
        token: _token,
      );
    }
    if (_currentIndex == 2) {
      return BottomNavigationBarThirdScreen(
        position: position,
        token: _token,
      );
    }
    if (_currentIndex == 3) {
      return BottomNavigationBarFourthScreen();
    }
    if (_currentIndex == 4) {
      return BottomNavigationBarFifthScreen();
    }
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Click again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppTheme.backGround,
        body: WillPopScope(
          onWillPop: () => onWillPop(),
          child: _getWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.white,
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_gas_station_rounded,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 25,
                ),
                label: '',
              ),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: AppTheme.blue,
            unselectedItemColor: AppTheme.dark_blue,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}

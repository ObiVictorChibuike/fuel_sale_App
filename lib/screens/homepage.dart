import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/bottom_naviagtionbar_second_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_first_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_third_screen.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/record_list_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  _getWidget() {
    if (_currentIndex == 0) {
      return BottomNavigationBarFirstScreen();
    } else if (_currentIndex == 1) {
      return BottomNavigationBarSecondScreen();
    }
    if (_currentIndex == 2) {
      return BottomNavigationBarThirdScreen();
    }
    if (_currentIndex == 3) {
      return BottomNavigationBarFirstScreen();
    }
    if (_currentIndex == 4) {
      return BottomNavigationBarFirstScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.backGround,
          body: _getWidget(),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 25,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card, size: 25,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, size: 25,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none, size: 25,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 25,),
                  label: '',
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: AppTheme.blue,
              unselectedItemColor: AppTheme.grey.withOpacity(0.8),
              onTap: (int index){
                setState(() {
                  _currentIndex = index;
                });
              }
          ),
        ),
    );
  }
}

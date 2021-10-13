import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_fifth_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_second_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_first_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_fourth_screen.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_third_screen.dart';


class HomePage extends StatefulWidget {
  final bool? isDelivery;
  const HomePage({Key? key, this.isDelivery}) : super(key: key);

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
      return BottomNavigationBarThirdScreen(isDelivery: widget.isDelivery);
    }
    if (_currentIndex == 3) {
      return BottomNavigationBarFourthScreen();
    }
    if (_currentIndex == 4) {
      return BottomNavigationBarFifthScreen();
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
                  icon: Icon(Icons.local_gas_station_rounded, size: 25,),
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

import 'homepage.dart';
class CardAddedSuccessfully extends StatefulWidget {
  const CardAddedSuccessfully({Key? key}) : super(key: key);

  @override
  _CardAddedSuccessfullyState createState() => _CardAddedSuccessfullyState();
}

class _CardAddedSuccessfullyState extends State<CardAddedSuccessfully> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), ()=>replaceScreen(context, HomePage()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 118,
                  width: 118,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.dark_blue.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Container(
                      height: 78,
                      width: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.dark_blue,
                      ),
                      child: Image.asset('assets/good.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 37,),
              Text('Card added', style: TextStyle(fontSize: 32, fontFamily: 'Nunito', fontWeight: FontWeight.w700, color: AppTheme.dark_blue),),
              SizedBox(height: 15,),
              Text('You can begin transaction with this card', style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Lato', fontSize: 14, color: AppTheme.dark_blue),)
            ],
          ),
        ),
      ),
    );
  }
}

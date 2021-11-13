import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/homepage.dart';

class VerificationSuccess extends StatefulWidget {
  const VerificationSuccess({Key? key}) : super(key: key);

  @override
  _VerificationSuccessState createState() => _VerificationSuccessState();
}

class _VerificationSuccessState extends State<VerificationSuccess> {

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
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/landing_page.png'),
                fit: BoxFit.cover,
              )
            ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width/ 3.5,
                  width: MediaQuery.of(context).size.width/ 3.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.white, width: 2),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/good.png"),
                  ),
                ),
                SizedBox(height: 30,),
                Text("Verification Success", style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Lato", fontSize: 18, color: AppTheme.white),),
              ],
            )
          ),
        ),
      ),
    );
  }
}

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
    return Center(
      child: SvgPicture.asset(
        'assets/verification_success.svg', color: AppTheme.white,
      ),
    );
  }
}

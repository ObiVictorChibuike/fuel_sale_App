import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/sign_up.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/landing_page.png'),
                    fit: BoxFit.cover,
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    SizedBox(height: 30,),
                    Text('Fuel Sales App', style: TextStyle(color: AppTheme.white, fontSize: 27, fontWeight: FontWeight.w700, fontFamily: 'Lato'),),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30, bottom: 150),
                  child: CustomButton(
                    buttonRadius: 14,
                    onPressed: (){
                      changeScreen(context, SignUpScreen());
                    },
                    buttonText: 'Get Started',
                    buttonHeight: 54,
                    decorationColor: AppTheme.blue,
                    borderColor: AppTheme.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 224,),
                      Text("Relax! We are almost done!", style: TextStyle(fontSize: 18, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.white),),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppTheme.backGround,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                    child: Column(
                      children: [
                        CustomReadOnlyFormField(
                          validator: (value){},
                          labelText: 'New Password',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 22,),
                        CustomReadOnlyFormField(
                          validator: (value){},
                          labelText: 'Repeat Password',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 30,),
                        CustomButton(
                          buttonRadius: 14,
                          onPressed: (){
                            changeScreen(context, HomePage());
                          },
                          buttonText: 'Reset',
                          buttonHeight: 54,
                          decorationColor: AppTheme.blue,
                          borderColor: AppTheme.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

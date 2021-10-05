import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/email_verification.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
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
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        height: MediaQuery.of(context).size.width / 10,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png')
                          )
                        ),
                      ),
                      SizedBox(height: 70,),
                      Text('Welcome', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24, fontFamily: 'Lato', color: AppTheme.white),),
                      SizedBox(height: 18,),
                      Text('Complete your registration', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, fontFamily: 'Lato', color: AppTheme.white),),
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
                        CustomFormField(
                            validator: (value){},
                          labelText: 'Full name',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 16,),
                        CustomFormField(
                          validator: (value){},
                          labelText: 'Email',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 16,),
                        CustomFormField(
                          validator: (value){},
                          labelText: '+234',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 16,),
                        CustomPasswordFormField(
                          validator: (value){},
                          labelText: 'Password',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 28,),
                        CustomButton(
                          buttonRadius: 14,
                          onPressed: (){
                            changeScreen(context, EmailVerificationScreen());
                          },
                          buttonText: 'Get Started',
                          buttonHeight: 54,
                          decorationColor: AppTheme.blue,
                          borderColor: AppTheme.blue,
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account ?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.blue)),
                            InkWell(
                              onTap: () {},
                              child: Text('Login in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.blue,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

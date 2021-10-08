import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/screens/reset_password_otp.dart';
import 'package:fuel_sale_app/screens/sign_up.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                          labelText: 'Email',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 22,),
                        CustomPasswordFormField(
                          validator: (value){},
                          labelText: 'Password',
                          focusedBorderColor: AppTheme.white,
                          enabledBorderColor: AppTheme.white,
                        ),
                        SizedBox(height: 30,),
                        CustomButton(
                          buttonRadius: 14,
                          onPressed: (){
                            changeScreen(context, HomePage());
                          },
                          buttonText: 'Log In',
                          buttonHeight: 54,
                          decorationColor: AppTheme.blue,
                          borderColor: AppTheme.blue,
                        ),
                        SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Forget password? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.grey)),
                            InkWell(
                              onTap: () {
                                changeScreen(context, ResetPasswordOtp());
                              },
                              child: Text('Click here',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.blue,
                                  )),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not registered yet? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.grey)),
                            InkWell(
                              onTap: () {
                                changeScreen(context, SignUpScreen());
                              },
                              child: Text('Create Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    fontFamily: 'Lato',
                                    color: AppTheme.blue,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height:  81,),
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

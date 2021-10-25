import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/login_model.dart';
import 'package:fuel_sale_app/repository/cached_data.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/screens/reset_password_otp.dart';
import 'package:fuel_sale_app/screens/sign_up.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final passwordValidator = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // void login_now(String email, String password, BuildContext c) async {
  //   var uri = Uri.https(baseURL, postLogin);
  //   var body = {'email': email, 'password' : password};
  //   final response = await post(
  //       uri, body: (body));
  //   CustomProgressDialog().showCustomAlertDialog(context, 'Please wait...');
  //   // ).timeout(
  //   //   Duration(seconds: 20),
  //   //   onTimeout: () {
  //   //     //pr.hide();
  //   //     Flushbar(
  //   //       message:  "Connection timeout, Please try again", padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
  //   //       flushbarPosition: FlushbarPosition.TOP,
  //   //       backgroundColor: Colors.red,
  //   //       duration:  Duration(seconds: 3),
  //   //     )..show(context);
  //   //
  //   //   },);
  //   var result = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     changeScreen(context, HomePage());
  //     //final _loginModel = loginResponseFromJson(response.body);
  //     //saveUserdata(c, _loginModel);
  //   } else {
  //     CustomProgressDialog().popCustomProgressDialogDialog(context);
  //     var msg = result['error'];
  //     //pr.hide();
  //     Flushbar(
  //       message:  msg, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       backgroundColor: Colors.red,
  //       duration:  Duration(seconds: 3),
  //     )..show(context);
  //   }
  // }

  void login(BuildContext context) async{
    CustomProgressDialog().showCustomAlertDialog(context, "Please wait...");
    await HttpService().userLogin(_email.text.trim(), _password.text.trim()).then((value) {
      var result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201) {
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        final response = loginResponseFromJson(value.body);
        //CachedData().saveUserdata(response);
        print(response);
        changeScreen(context, HomePage());
      }
      else {
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        var errorMsg = result["message"];
        alertBar(context, errorMsg, AppTheme.red);
      }
    })
    .timeout(Duration(seconds: 20), onTimeout: (){
    CustomProgressDialog().popCustomProgressDialogDialog(context);
    alertBar(context, "Network timeout! Try again.", AppTheme.red);
    return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/landing_page.png'), fit: BoxFit.cover,)),
                ),
                Align(alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppTheme.backGround,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: _email,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Password cannot be empty';
                              } else if (!emailValidator.hasMatch(value)){
                                return 'Password is weak';
                              } else {
                                return null;
                              }
                            },
                            labelText: 'Email',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 22,),
                          CustomPasswordFormField(
                            controller: _password,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Password cannot be empty';
                              } else if (!passwordValidator.hasMatch(value)){
                                return 'Password is weak';
                              } else {
                                return null;
                              }
                            },
                            labelText: 'Password',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 30,),
                          CustomButton(
                            buttonRadius: 14,
                            onPressed: () {
                              login(context);
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
          ),
        )
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/userDetailsModel.dart';
import 'package:fuel_sale_app/repository/cached_data.dart';
import 'package:fuel_sale_app/screens/verification_successful.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String? userEmail;
  const EmailVerificationScreen({Key? key, this.userEmail}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  var _otp, _userEmail;

  void authUser(String value) async{
    setState(() {value = _otp;});
    CustomProgressDialog().showCustomAlertDialog(context, "Verifying...");
    await HttpService().validateOTP(_userEmail, _otp.toString()).then((value) async {
      var result= jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201) {
        final response = signUpResponseFromOtpValidationFromJson(value.body);
        RepositoryService().saveUserdata(response);
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        changeScreen(context, VerificationSuccess());
      }else{
        var errorMsg = result["message"];
        alertBar(context, errorMsg, AppTheme.red);
      }}
    ).timeout(Duration(seconds: 20), onTimeout: (){
      alertBar(context, "Network Timeout", AppTheme.red);
      return null;
    });
  }




  @override
  void initState() {
    setState(() {
      _userEmail = widget.userEmail;
    });
    super.initState();
  }

  Widget emailVerification(){
    final String assetName = 'assets/ios_back_arrow.svg';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60,),
          InkWell(
            onTap: (){Navigator.of(context).pop();},
            child: SvgPicture.asset(assetName, color: AppTheme.white, height: 30,),),
          SizedBox(height: 40,),
          Text('Email Verification', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 22, color: AppTheme.white),),
          SizedBox(height: 3,),
          Text('We sent verification code to', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.white),),
          Text('your email: $_userEmail.', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.white),),
          SizedBox(height: 67,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0),
            child: Container(
              width: double.maxFinite,
              child: Center(child: Text('Resend Code', style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.blue),)),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.blue),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: optWidget(context),
          ),
        ],
      ),
    );
  }

  Widget optWidget(BuildContext context){
    return PinCodeTextField(
      onCompleted: (String value) {
        authUser(value);
      },
      textStyle: TextStyle(color: AppTheme.white),
        pinTheme: PinTheme(
          inactiveFillColor: AppTheme.blue,
          activeColor: AppTheme.blue,
          errorBorderColor: AppTheme.white,
          selectedColor: AppTheme.blue,
          selectedFillColor: AppTheme.white,
          inactiveColor: AppTheme.white,
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 40,
          fieldWidth: 40,
          activeFillColor: Colors.white,
        ),
        keyboardType: TextInputType.phone,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        textCapitalization: TextCapitalization.words,
        errorAnimationDuration: 500,
        cursorHeight: 25,
        cursorColor: AppTheme.blue,
        textInputAction: TextInputAction.next,
        obscureText: true,
        appContext: context,
        length: 4,
      onChanged: (String value) {
        setState(() {
          _otp = value;
        });
      },
    );
  }
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
                child: emailVerification(),
              ),
            ],
          )
        )
    );
  }
}

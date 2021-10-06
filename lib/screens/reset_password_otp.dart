import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPasswordOtp extends StatelessWidget {
  const ResetPasswordOtp({Key? key}) : super(key: key);

  Widget optWidget(BuildContext context){
    return PinCodeTextField(
      textStyle: TextStyle(color: AppTheme.grey),
      pinTheme: PinTheme(
        inactiveFillColor: AppTheme.grey,
        activeColor: AppTheme.blue,
        errorBorderColor: AppTheme.white,
        selectedColor: AppTheme.blue,
        selectedFillColor: AppTheme.white,
        inactiveColor: AppTheme.grey,
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
      textInputAction: TextInputAction.done,
      obscureText: true,
      appContext: context,
      length: 4,
      onChanged: (value){

      },
    );
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 31.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 164,),
                    Text("We've sent a RESET code to the email", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, fontFamily: 'Lato', color: AppTheme.white),),
                    SizedBox(height: 2,),
                    Text('Jayvictor999@gmail.com', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, fontFamily: 'Lato', color: AppTheme.blue),),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive any code?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                color: AppTheme.white)),
                        InkWell(
                          onTap: () {

                          },
                          child: Text(' Resend',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
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
                child: Column(
                  children: [
                    SizedBox(height: 200,),
                    Text('Enter the RESET code sent to your email', style: TextStyle(color: AppTheme.grey, fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16),),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: optWidget(context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

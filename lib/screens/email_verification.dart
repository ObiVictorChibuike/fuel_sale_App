import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/ios_back_arrow.svg';
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60,),
                  InkWell(
                    onTap: (){Navigator.of(context).pop();},
                    child: SvgPicture.asset(
                        assetName, color: AppTheme.white, height: 30,
                    ),
                  ),
                      SizedBox(height: 40,),
                      Text('Email Verification', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 22, color: AppTheme.white),),
                      SizedBox(height: 3,),
                      Text('We sent verification code to', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.white),),
                      Text('your number: Jayvictor999@gmail.com', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.white),),
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
                    ],
                  ),
                ),
              ),
            ],
          )
        )
    );
  }
}

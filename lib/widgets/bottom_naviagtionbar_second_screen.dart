import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/add_card.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
class BottomNavigationBarSecondScreen extends StatefulWidget {
  const BottomNavigationBarSecondScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarSecondScreenState createState() => _BottomNavigationBarSecondScreenState();
}

class _BottomNavigationBarSecondScreenState extends State<BottomNavigationBarSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/landing_page.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 147,),
              Container(
                height: 96,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/master_card.svg',
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 22,),
                        Text('**** **** **** 4826 Mastercard', style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        Spacer(),
                        Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        SizedBox(height: 22),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 96,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/visa_card.svg',
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 22,),
                        Text('**** **** **** 1147 Visa', style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        Spacer(),
                        Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        SizedBox(height: 22),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 96,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/master_card.svg',
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 22,),
                        Text('**** **** **** 4826 Mastercard', style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        Spacer(),
                        Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        SizedBox(height: 22),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 96,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/visa_card.svg',
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 22,),
                        Text('**** **** **** 1147 Visa', style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        Spacer(),
                        Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                        SizedBox(height: 22),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              CustomButton(
                  onPressed: (){
                    changeScreen(context, AddCard());
                  },
                buttonHeight: 96,
                decorationColor: AppTheme.blue,
                buttonText: 'ADD NEW CARD',
                borderColor: AppTheme.blue,
                buttonRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

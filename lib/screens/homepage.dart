import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.backGround,
          body: Column(
            children: [
              SizedBox(height: 88,),
              Row(
                children: [
                  Container(
                    height: 24,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Center(child: Text('Hello! James', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.dark_blue),)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppTheme.homeBackGround,
                      ),
                      child: Text('All Cards', style: TextStyle(fontSize: 13, fontFamily: "Lato", fontWeight: FontWeight.w300, color: AppTheme.dark_blue),),
                    ),
                  ),
                  SizedBox(height: 17),
                  Container(
                    height: 190,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/card.svg', color: AppTheme.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}

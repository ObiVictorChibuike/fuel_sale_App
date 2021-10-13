
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[AppTheme.gradientBlue1, AppTheme.gradientBlue2],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                      SizedBox(width: 120,),
                      Container(child: Text('Help', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                    ],
                  ),
                ],
              )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75,),
              Text('FAQs', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),),
              SizedBox(height: 30,),
              Text('Signing Up', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),),
              SizedBox(height: 30,),
              Text('App Tour', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),),
              SizedBox(height: 30,),
              Text('Account and Payment Option', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),),
              SizedBox(height: 30,),
              Text('Contact Online agent', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),),
            ],
          ),
        ),
      ),
    );
  }
}
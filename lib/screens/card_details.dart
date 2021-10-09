import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset:  false,
          backgroundColor: AppTheme.backGround,
          appBar: AppBar(
            backgroundColor: AppTheme.backGround,
            elevation: 0,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,), onPressed: (){Navigator.of(context).pop();
            },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70,),
                Text('Total Card Balance', style: TextStyle(fontSize: 12,fontFamily: 'Nunito', fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                SizedBox(height: 5,),
                CustomReadOnlyFormField(
                  initialValue: 'N5,400,000.50',
                  backgroundColor: AppTheme.white,
                    height: 56,
                    validator: (value){},
                  focusedBorderColor: AppTheme.white,
                  enabledBorderColor: AppTheme.white,
                ),
                SizedBox(height: 24,),
                Text('Loyalty Point Balance', style: TextStyle(fontSize: 12,fontFamily: 'Nunito', fontWeight: FontWeight.w400, color: AppTheme.dark_blue)),
                SizedBox(height: 5,),
                CustomReadOnlyFormField(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 20, left: 0.0, bottom: 0.0),
                    child: Text('Expires in 28 days', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.grey.withOpacity(0.5)),),
                  ),
                  initialValue: '300p',
                  backgroundColor: AppTheme.white,
                  height: 56,
                  validator: (value){},
                  focusedBorderColor: AppTheme.white,
                  enabledBorderColor: AppTheme.white,
                ),
                SizedBox(height: 24,),
                Text('Total Expenses',style: TextStyle(fontSize: 12,fontFamily: 'Nunito', fontWeight: FontWeight.w400, color: AppTheme.dark_blue)),
                SizedBox(height: 5,),
                CustomReadOnlyFormField(
                  initialValue: 'N5,400,000.50',
                  backgroundColor: AppTheme.white,
                  height: 56,
                  validator: (value){},
                  focusedBorderColor: AppTheme.white,
                  enabledBorderColor: AppTheme.white,
                ),
                SizedBox(height: 24,),
                Text('Loyalty Point Balance',style: TextStyle(fontSize: 12,fontFamily: 'Nunito', fontWeight: FontWeight.w400, color: AppTheme.dark_blue)),
                SizedBox(height: 5,),
                CustomReadOnlyFormField(
                  initialValue: 'N8,990,223.50',
                  backgroundColor: AppTheme.white,
                  height: 56,
                  validator: (value){},
                  focusedBorderColor: AppTheme.white,
                  enabledBorderColor: AppTheme.white,
                ),
              ],
            ),
          ),
        ),
    );
  }
}

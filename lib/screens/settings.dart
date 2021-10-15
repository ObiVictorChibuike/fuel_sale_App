
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/account.dart';
import 'package:fuel_sale_app/screens/change_password.dart';
import 'package:fuel_sale_app/screens/toggle_notification.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                      SizedBox(width: 100,),
                      Container(child: Text('Settings', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                    ],
                  ),
                ],
              )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 69.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75,),
              GestureDetector(
                  onTap: (){changeScreen(context, AccountSettings());},
                  child: Container(width: double.maxFinite, height: 40,child: Text('Account', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),))),
              SizedBox(height: 10,),
              InkWell(
                  onTap: (){changeScreen(context, ChangePasswordSetting());},
                  child: Container( height: 40, width: double.maxFinite,child: Text('Security', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),))),
              SizedBox(height: 10,),
              InkWell(
                  onTap:() {changeScreen(context, ToggleNotification());},
                  child: Container(width:double.maxFinite, height: 40,child: Text('Notification', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato',),))),
              Spacer(),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 50, width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: AppTheme.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Icon(Icons.arrow_back_ios, size: 20, color: AppTheme.grey.withOpacity(0.5),),
                          ),
                      ),
                      SizedBox(width: 20,),
                      Text('Log Out', style: TextStyle(fontFamily: 'Lato', fontSize: 20, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 112,)
            ],
          ),
        ),
      ),
    );
  }
}
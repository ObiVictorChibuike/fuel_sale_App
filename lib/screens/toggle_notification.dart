
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';

class ToggleNotification extends StatefulWidget {
  const ToggleNotification({Key? key}) : super(key: key);

  @override
  _ToggleNotificationState createState() => _ToggleNotificationState();
}

class _ToggleNotificationState extends State<ToggleNotification> {
  late bool? isSwitchNotificationOn = false;
  late bool? isSwitchSMSOn = false;
  late bool? isSwitchUpdatePromptOn = false;
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
                        SizedBox(width: 80,),
                        Container(child: Text('Notifications', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                      ],
                    ),
                  ],
                )
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28, top: 58, bottom: 58),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 26),
                  child: Column(
                    children: [
                      SizedBox(height: 48,),
                      Text('Toggle Notification', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21, color: AppTheme.dark_blue),),
                      SizedBox(height: 48,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email notification', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.dark_blue),),
                              Text('Get important notification by mail', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            activeColor: AppTheme.dark_blue,
                              value: isSwitchNotificationOn!, onChanged: (bool value){
                            setState(() {
                            isSwitchNotificationOn = value;
                          });})
                        ],
                      ),
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SMS notification', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.dark_blue),),
                              Text('Get important notification by SMS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
                            ],
                          ),
                          Spacer(),
                          Switch(
                              activeColor: AppTheme.dark_blue,
                              value: isSwitchSMSOn!, onChanged: (bool value){
                            setState(() {
                              isSwitchSMSOn = value;
                            });})
                        ],
                      ),
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Update Prompts', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.dark_blue),),
                              Text('Get app update notification', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
                            ],
                          ),
                          Spacer(),
                          Switch(
                              activeColor: AppTheme.dark_blue,
                              value: isSwitchUpdatePromptOn!, onChanged: (bool value){
                            setState(() {
                              isSwitchUpdatePromptOn = value;
                            });}),
                        ],
                      ),
                      SizedBox(height: 203,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: CustomButton(
                            decorationColor: AppTheme.dark_blue,
                            buttonHeight: 36,
                            buttonText: 'Save Settings',
                            textColor: AppTheme.white,
                            onPressed: (){

                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}

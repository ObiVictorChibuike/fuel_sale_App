import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/filter_icon_icons.dart';
import 'package:fuel_sale_app/model/dummy_chat_model.dart';
import 'package:fuel_sale_app/model/dummy_message_center_model.dart';
import 'package:fuel_sale_app/screens/message_center_details.dart';

class BottomNavigationBarFourthScreen extends StatefulWidget {
  const BottomNavigationBarFourthScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarFourthScreenState createState() => _BottomNavigationBarFourthScreenState();
}

class _BottomNavigationBarFourthScreenState extends State<BottomNavigationBarFourthScreen> {
  late bool? isMessageSelected = true;
  late bool? isChatSelected = false;

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

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
                        SizedBox(width: 70,),
                        Container(child: Text('Notifications', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                      ],
                    ),
                  ],
                )
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 39,
                color: AppTheme.grey.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Later than 30days', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),), Spacer(), Icon(FilterIcon.sliders, color: AppTheme.grey.withOpacity(0.5),),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppTheme.grey.withOpacity(0.1),
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isMessageSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height:  MediaQuery.of(context).size.width / 6,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Center(child: Text('Message center', style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.w600, color: isMessageSelected! ? AppTheme.dark_blue : AppTheme.grey.withOpacity(0.5)),)),
                          ),
                          Container(
                            color: isMessageSelected! ? AppTheme.blue : AppTheme.grey.withOpacity(0.5),
                            height: 2,
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isMessageSelected = !isMessageSelected!;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height:  MediaQuery.of(context).size.width / 6,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Center(child: Text('Chat', style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.w600, color: !isMessageSelected! ?  AppTheme.dark_blue : AppTheme.grey.withOpacity(0.5)),)),
                          ),
                          Container(
                            color: !isMessageSelected! ?  AppTheme.blue : AppTheme.grey.withOpacity(0.5),
                            height: 2,
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isMessageSelected! ?
              FutureBuilder<bool>(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 100,),
                            SvgPicture.asset(
                              'assets/Lamp.svg', color: AppTheme.grey.withOpacity(0.5),
                            ),
                            SvgPicture.asset(
                              'assets/Lamp1.svg', color: AppTheme.grey.withOpacity(0.2),
                            ),
                            Text('No notification found', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: MessageCenter.messageCenterModel.length,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 19.0),
                                child: Card(
                                  elevation: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppTheme.grey.withOpacity(0.2),
                                          spreadRadius: .5,
                                          blurRadius: 1,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  height: 98,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppTheme.red
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Text(MessageCenter.messageCenterModel[index].title!, textAlign: TextAlign.start, style: TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.dark_blue),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0),
                                        child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width
                                            ),
                                            child: Text(MessageCenter.messageCenterModel[index].deliveryStatus!, textAlign: TextAlign.start, style: TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.dark_blue),),),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
                                            child: Text(MessageCenter.messageCenterModel[index].deliveryTime!, style: TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w100, color: AppTheme.dark_blue),),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      GestureDetector(
                                        onTap: (){
                                          changeScreen(context, MessageCenterDetails());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
                                          child: Row(
                                            children: [
                                              Text('See Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Lato', color: AppTheme.blue),),
                                              Spacer(),
                                              Icon(Icons.arrow_forward_ios, size: 14, color: AppTheme.grey.withOpacity(0.3),),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  ),
                                ),
                              );
                            }
                        ),
                      );
                  }
                },
              ) : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ChatModel.chatModel.length,
                    itemBuilder: (BuildContext context, int index){
                       return Container(
                         height: 90,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 18.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               CircleAvatar(
                                 backgroundColor: AppTheme.dark_blue.withOpacity(0.5),
                                 radius: 30,
                                   child: Text(ChatModel.chatModel[index].avatar!.substring(0,1), style: TextStyle(fontFamily: 'Lato', fontSize: 30, fontWeight: FontWeight.bold, color: AppTheme.white),),
                               ),
                               SizedBox(width: 60,),
                               Column(
                                 children: [
                                   SizedBox(height: 30,),
                                   Text(ChatModel.chatModel[index].name!, style: TextStyle(fontFamily: 'Lato', fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.3)),),
                                   Text(ChatModel.chatModel[index].msg!, style: TextStyle(fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.3)),),
                                 ],
                               )
                             ],
                           ),
                         ),
                       );
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}

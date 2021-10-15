import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:intl/intl.dart';

class MessageCenterDetails extends StatefulWidget {
  const MessageCenterDetails({Key? key}) : super(key: key);

  @override
  _MessageCenterDetailsState createState() => _MessageCenterDetailsState();
}

class _MessageCenterDetailsState extends State<MessageCenterDetails> {
  String? _timeString;
  void _getTime(){
    final String formattedDateTime = DateFormat('kk:mm:ss       yyyy/mm/dd').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
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
                        SizedBox(width: 80,),
                        Container(child: Text('Message Center', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                      ],
                    ),
                  ],
                )
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 46, right: 65, top: 36, bottom: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_timeString.toString(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
                SizedBox(height: 25,),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width
                    ),
                    child: Text('Dear user, this is to notify you that your order has been initiated and will be completed within the next 4 hours as estimated', style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.dark_blue),)),
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    //Timer.periodic(Duration(seconds: 1), (Timer timer) => _getTime());
    _getTime();
    super.initState();
  }
}

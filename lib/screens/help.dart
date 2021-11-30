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
                    colors: <Color>[AppTheme.white, AppTheme.notWhite],
                  ),
                  border: Border(
                    bottom: BorderSide(width: 2, color: AppTheme.dark_blue),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.dark_blue,
                            )),
                        Spacer(
                          flex: 5,
                        ),
                        Container(
                            child: Text(
                          'Help',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              fontFamily: "lato",
                              color: AppTheme.dark_blue),
                        )),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75,
              ),
              InkWell(
                onTap: () {
                  // changeScreen(context, Settings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.question_answer_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'FAQS',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  // changeScreen(context, Settings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.tour_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'App Tour',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  // changeScreen(context, Settings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Account and Payment Option',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  // changeScreen(context, Settings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.support_agent_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Contact Online Agent',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

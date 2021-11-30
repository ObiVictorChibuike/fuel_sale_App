import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class Legal extends StatelessWidget {
  const Legal({Key? key}) : super(key: key);

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
                          'Legal',
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
                        Icons.settings_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Copy Right',
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
                        Icons.my_library_books_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Terms and Conditions',
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
                        Icons.privacy_tip_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Privacy Policy',
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
                        Icons.app_settings_alt_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Software Licenses',
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
              // Text(
              //   'Location Information',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 18,
              //     fontFamily: 'Nunito',
              //     color: AppTheme.dark_blue,
              //   ),
              // ),
              InkWell(
                onTap: () {
                  // changeScreen(context, Settings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Settings',
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
                        Icons.gavel_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'City Regulations',
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

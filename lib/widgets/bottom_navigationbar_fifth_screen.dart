import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/help.dart';
import 'package:fuel_sale_app/screens/legal.dart';
import 'package:fuel_sale_app/screens/settings.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarFifthScreen extends StatefulWidget {
  const BottomNavigationBarFifthScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarFifthScreenState createState() =>
      _BottomNavigationBarFifthScreenState();
}

class _BottomNavigationBarFifthScreenState
    extends State<BottomNavigationBarFifthScreen> {
  var _firstName, _lastName, _email, _phoneNumber, _dob, _sex;

  final df = new DateFormat('yyyy-MM-dd');

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _firstName = (userdata.getString("firstName"));
      _lastName = (userdata.getString("lastName"));
      _email = (userdata.getString("userEmail"));
      _dob = (userdata.getString("userDOB"));
      _sex = (userdata.getString("userSex"));
      _phoneNumber = (userdata.getString("userPhoneNumber"));
    });
  }

  @override
  void initState() {
    initUserData();
    super.initState();
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.grey.shade200,
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      changeScreen(context, Legal());
                    },
                    child: Container(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Icon(
                            Icons.gavel,
                            size: 30,
                            color: AppTheme.dark_blue,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Legal',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.dark_blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      changeScreen(context, Help());
                    },
                    child: Container(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Icon(
                            Icons.help_center_outlined,
                            size: 30,
                            color: AppTheme.dark_blue,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Help',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.dark_blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      changeScreen(context, Settings());
                    },
                    child: Container(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            size: 30,
                            color: AppTheme.dark_blue,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.dark_blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
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
                            Icons.logout,
                            size: 30,
                            color: AppTheme.dark_blue,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'logout',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
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
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppTheme.backGround,
        appBar: AppBar(
          backgroundColor: AppTheme.backGround,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  _showModalBottomSheet();
                },
                icon: Icon(
                  Icons.menu,
                  color: AppTheme.dark_blue,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.blue, width: 5.0),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 40.25,
                  backgroundImage: AssetImage('assets/userImage.png'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "$_firstName $_lastName",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    fontFamily: 'Nunito',
                    color: AppTheme.dark_blue),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "${_firstName.toString().substring(0, 1)}${_lastName.toString().substring(0)}",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    color: AppTheme.dark_blue),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                '$_email',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    color: AppTheme.dark_blue),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "$_phoneNumber",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    color: AppTheme.dark_blue),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 46,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Number of transactions',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.5,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white),
                        ),
                        Spacer(),
                        Text(
                          '32',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 15.5,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 61,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Birth',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.5,
                              fontFamily: 'Nunito',
                              color: AppTheme.dark_blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sex',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.5,
                              fontFamily: 'Nunito',
                              color: AppTheme.dark_blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${df.format(DateTime.parse(_dob))}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.5,
                              fontFamily: 'Nunito',
                              color: AppTheme.dark_blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$_sex",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.5,
                              fontFamily: 'Nunito',
                              color: AppTheme.dark_blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

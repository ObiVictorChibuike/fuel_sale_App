import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/dummy_card_details.dart';
import 'package:fuel_sale_app/model/dummy_record_model.dart';
import 'package:fuel_sale_app/screens/card_details.dart';
import 'package:fuel_sale_app/screens/deposit.dart';
import 'package:fuel_sale_app/screens/sign_up_screen.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/record_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarFirstScreen extends StatefulWidget {
  const BottomNavigationBarFirstScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarFirstScreenState createState() => _BottomNavigationBarFirstScreenState();
}

class _BottomNavigationBarFirstScreenState extends State<BottomNavigationBarFirstScreen> {

  var _firstName, _lastName, _userEmail, _userPhoneNumber, _userDOB, _sex, _token;

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _firstName = (userdata.getString("firstName"));
      _lastName = (userdata.getString("lastName"));
      _userEmail = (userdata.getString("userEmail"));
      _userPhoneNumber = (userdata.getString("userPhoneNumber"));
      _userDOB = (userdata.getString("userDOB"));
      _token = (userdata.getString("token"));
      _sex = (userdata.getString("userSex"));
    });
  }


  String? text;
  int? selectedIndex = 0;
  Color? textColor = AppTheme.dark_blue;
  Color? indexColor = AppTheme.blue;
  late SharedPreferences prefs;

  List<String> filters = [
    'All',
    'Expenses',
    'Credit',
  ];

  List<String> thisWeek = <String>[
    'This week',
    'This month',
    'Last week',
    'Last month',
    'Half year',
    'Year'
  ];

  _buildDialog(BuildContext context) => showDialog(context: context, builder: (BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView.builder(itemCount: thisWeek.length,itemBuilder: (context, int index) =>
              GestureDetector(
                onTap: (){
                  //if (text != thisWeek[index]) {
                    setState(() {
                      textColor = AppTheme.dark_blue;
                      text = thisWeek[index];
                      Navigator.of(context).pop();
                      selectedIndex = index;
                    });
                  // }else{
                  //   setState(() {
                  //     textColor = Colors.blue;
                  //   });
                  // }

                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          selectedIndex == index ? Icon(Icons.check, color: AppTheme.dark_blue, size: 18,) : Container(),
                          Text(thisWeek[index], style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w700, fontSize: 16, color: indexColor!),),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );}
  );

  static List<CardDetail> cardData = [
    CardDetail(
      title: 'Total Card Balance',
      content: 'N5,400,000.50',
    ),
    CardDetail(
      title: 'Loyalty Point Balance',
      content: '300p',
    ),
    CardDetail(
      title: 'Total Expenses',
      content: 'N5,400,000.50',
    ),
    CardDetail(
      title: 'Loyalty Point Balance',
      content: 'N8,990,223.50',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 88,),
            Row(
              children: [
                Container(
                  height: 24,
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: Center(child: Text('Hello! $_firstName', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.dark_blue),)),
                ),
                Spacer(),
                Container(
                  height: 22,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.grey.withOpacity(0.1),
                  ),
                  child: InkWell(
                    onTap: ()async{
                      prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isLoggedIn', false);
                        replaceScreen(context, SignUpScreen());
                    },
                      child: Center(child: Text('All Cards', style: TextStyle(fontSize: 13, fontFamily: "Lato", fontWeight: FontWeight.w300, color: AppTheme.dark_blue),))),
                ),
              ],
            ),
            SizedBox(height: 17),
            Container(
              height: 190,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft,
                    colors: [AppTheme.gradientBlue1, AppTheme.gradientBlue2],
                  )
              ),
              child: Stack(children: [
                Align(
                    child: Padding(padding: const EdgeInsets.only(bottom: 38.0, left: 30),
                      child: Text("4343 6768 7684 3322", style: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.white),),),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0, left: 30),
                    child: Text("$_firstName $_lastName", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "poppins", color: AppTheme.white),),),
                  alignment: Alignment.bottomLeft,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(height: 100, width: 100,
                      child: Image.asset("assets/mascard.png")),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 40),
                    child: Text("Expiry date", style: TextStyle(fontFamily: "Poppins", fontSize: 8, fontWeight: FontWeight.w400, color: AppTheme.white),),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 20),
                    child: Text("12/2021", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, fontFamily: "Poppins", color: AppTheme.white),),
                  ),
                )
              ],),
            ),
            SizedBox(height: 17,),
            Container(
              width: double.maxFinite,
              height: 184,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 74,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 17,),
                        Text('07 Sept - 14 Sept', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', fontSize: 13, color: AppTheme.grey.withOpacity(0.5)),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      changeScreen(context, CardDetails());
                    },
                    child: Container(
                      height: 56,
                      width: double.maxFinite,
                      color: AppTheme.grey.withOpacity(0.1),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cardData.length,
                          itemBuilder: (BuildContext context, int index)=>
                              Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(cardData[index].content!, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 14, color: AppTheme.grey.withOpacity(0.5)), ),),
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(cardData[index].title!, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 12.16, color: AppTheme.dark_blue), ),),
                                    ],
                                  ),
                                ],
                              )
                      ),
                    ),
                  ),
                  Container(
                    height: 54,
                    width: double.maxFinite,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
                        child: CustomButton(decorationColor: AppTheme.dark_blue, onPressed: (){changeScreen(context, Deposit());}, buttonHeight: 31, buttonText: 'Deposit', labelFontSize: 10,),),),),
                ],
              ),
            ),
            SizedBox(height: 26,),
            Row(
              children: [
                CustomButton( buttonWidth: MediaQuery.of(context).size.width / 4, decorationColor: AppTheme.white, buttonHeight: 32, onPressed: (){_buildDialog(context );}, buttonText: text ?? 'This week', buttonTextColor: textColor!, labelFontSize: 13,),
                Spacer(),
                CustomButton(labelFontSize: 13, buttonWidth: MediaQuery.of(context).size.width / 4, decorationColor: AppTheme.white, buttonHeight: 32, buttonText: 'Export as PDF', buttonTextColor: AppTheme.dark_blue, onPressed: (){},),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppTheme.white,
                child: Column(
                  children: [
                    ButtonFilter(),
                    ...List.generate(Record.records.length, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.grey.withOpacity(0.1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(height: 9,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Record.records[index].title.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 14, color: Record.records[index].titleColor),),
                                  SizedBox(height: 3,),
                                  Row(
                                    children: [
                                      Text(Record.records[index].date.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 11, color: AppTheme.grey),),
                                      Text(Record.records[index].time.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 11, color: AppTheme.grey),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Record.records[index].amount.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 14, color: Record.records[index].amountColor),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    initUserData();
    super.initState();
  }
}

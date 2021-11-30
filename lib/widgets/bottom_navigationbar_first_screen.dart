import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/dummy_card_details.dart';
import 'package:fuel_sale_app/model/dummy_record_model.dart';
import 'package:fuel_sale_app/model/get_all_transaction_response_model.dart';
import 'package:fuel_sale_app/screens/card_details.dart';
import 'package:fuel_sale_app/screens/deposit.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/record_list_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarFirstScreen extends StatefulWidget {
  final String token;
  const BottomNavigationBarFirstScreen({Key? key, required this.token})
      : super(key: key);

  @override
  _BottomNavigationBarFirstScreenState createState() =>
      _BottomNavigationBarFirstScreenState();
}

class _BottomNavigationBarFirstScreenState
    extends State<BottomNavigationBarFirstScreen> {
  var _firstName, _lastName;
  bool isCardAdded = false;

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _firstName = (userdata.getString("firstName"));
      _lastName = (userdata.getString("lastName"));
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
    'Last week',
    'This month',
    'Last month',
    'Half year',
    'Year'
  ];

  _buildDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
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
              child: ListView.builder(
                  itemCount: thisWeek.length,
                  itemBuilder: (context, int index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            textColor = AppTheme.dark_blue;
                            text = thisWeek[index];
                            Navigator.of(context).pop();
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    thisWeek[index],
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: indexColor!),
                                  ),
                                  selectedIndex == index
                                      ? Icon(
                                          Icons.check,
                                          color: AppTheme.dark_blue,
                                          size: 18,
                                        )
                                      : Container(),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        );
      });

  static List<CardDetail> cardData = [
    CardDetail(
      title: 'Card Balance',
      content: 'NGN5,400,000.50',
    ),
    CardDetail(
      title: 'Point Balance',
      content: '300P',
    ),
    CardDetail(
      title: 'Expenses',
      content: 'NGN5,400,000.50',
    ),
    CardDetail(
      title: 'Credit',
      content: 'N8,990,223.50',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppTheme.white,
                child: Text(
                  'Hello! $_firstName',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      color: AppTheme.dark_blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 22,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppTheme.white,
                          ),
                          child: InkWell(
                              onTap: () {},
                              // onTap: () async {
                              //   prefs = await SharedPreferences.getInstance();
                              //     prefs.setBool('isLoggedIn', false);
                              //     replaceScreen(context, SignUpScreen());
                              // },
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 9.0),
                                child: Text(
                                  'All Cards',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.dark_blue),
                                ),
                                // Spacer(),
                                // isCardAdded == false
                                //     ? SizedBox()
                                //     : Icon(Icons.arrow_drop_down_outlined),
                                // ],
                                // ),
                              ))),
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    Container(
                      height: 190,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppTheme.gradientBlue1,
                              AppTheme.gradientBlue2
                            ],
                          )),
                      child: Stack(
                        children: [
                          Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 38.0, left: 30),
                              child: Text(
                                "4343 6768 7684 3322",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 70.0, left: 30),
                              child: Text(
                                "$_firstName $_lastName",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: "Nunito",
                                    color: AppTheme.white),
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/mascard.png")),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 40),
                              child: Text(
                                "Expiry date",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 20),
                              child: Text(
                                "12/2021",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    fontFamily: "Nunito",
                                    color: AppTheme.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 184,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.grey.withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              changeScreen(context, CardDetails());
                            },
                            child: Container(
                              height: 95,
                              width: double.maxFinite,
                              color: AppTheme.grey.withOpacity(0.02),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cardData.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  cardData[index].content!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 18,
                                                      color:
                                                          AppTheme.dark_blue),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  cardData[index].title!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 14.16,
                                                      color:
                                                          AppTheme.dark_blue),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 54,
                            width: double.maxFinite,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 10),
                                child: CustomButton(
                                  decorationColor: AppTheme.dark_blue,
                                  onPressed: () {
                                    changeScreen(
                                        context,
                                        Deposit(
                                          token: widget.token,
                                        ));
                                  },
                                  buttonHeight: 42,
                                  buttonText: 'Deposit',
                                  labelFontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          buttonWidth: MediaQuery.of(context).size.width / 3,
                          decorationColor: AppTheme.white,
                          buttonHeight: 32,
                          onPressed: () {
                            _buildDialog(context);
                          },
                          buttonText: text ?? 'This week',
                          buttonTextColor: textColor!,
                          labelFontSize: 13,
                        ),
                        Spacer(),
                        CustomButton(
                          labelFontSize: 13,
                          buttonWidth: MediaQuery.of(context).size.width / 3,
                          decorationColor: AppTheme.white,
                          buttonHeight: 32,
                          buttonText: 'Export as PDF',
                          buttonTextColor: AppTheme.dark_blue,
                          onPressed: () {},
                        ),
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
                            FutureBuilder<List<GetAllTransactionModelResponse>>(
                                future: HttpService()
                                    .getAllTransactions(widget.token),
                                builder: (context,
                                    AsyncSnapshot<
                                            List<
                                                GetAllTransactionModelResponse>>
                                        snapshot) {
                                  if (!snapshot.hasData) {
                                    return SizedBox();
                                  } else {
                                    return Column(
                                      children: [
                                        ...List.generate(snapshot.data!.length,
                                            (index) {
                                          final data = snapshot.data![index];
                                          return Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppTheme.grey
                                                    .withOpacity(0.1),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 9,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          data.vendorId
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: 14,
                                                              color: Record
                                                                  .records[
                                                                      index]
                                                                  .titleColor),
                                                        ),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              Record
                                                                  .records[
                                                                      index]
                                                                  .date
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize: 11,
                                                                  color: AppTheme
                                                                      .grey),
                                                            ),
                                                            Text(
                                                              data.createdAt
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize: 11,
                                                                  color: AppTheme
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      data.transAmount
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontFamily: 'Nunito',
                                                          fontSize: 14,
                                                          color: Record
                                                              .records[index]
                                                              .amountColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    );
                                  }
                                }),
                          ],
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

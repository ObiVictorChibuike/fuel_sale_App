import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/get_all_card_for_user_model.dart';
import 'package:fuel_sale_app/screens/add_card.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';

class BottomNavigationBarSecondScreen extends StatefulWidget {
  final String token;
  const BottomNavigationBarSecondScreen({Key? key, required this.token}) : super(key: key);

  @override
  _BottomNavigationBarSecondScreenState createState() => _BottomNavigationBarSecondScreenState();
}

class _BottomNavigationBarSecondScreenState extends State<BottomNavigationBarSecondScreen> {


  Widget allCardForAUser(){
    return FutureBuilder <List<GetAllCardForAUserResponseModel>> (
      future: HttpService().userAllCardDetailsForUser(widget.token),
        builder: (context, AsyncSnapshot<List<GetAllCardForAUserResponseModel>> snapshot ){
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 96,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/logo.png',),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 22,),
                            Text(data.cardNumber.toString(), style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                            Spacer(),
                            Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                            SizedBox(height: 22),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Expanded(
              child: Container(
                child: Center(
                  child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                     child: Center(child: CupertinoActivityIndicator(radius: 20,),),
                  
              ))));
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/landing_page.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 147,),
              allCardForAUser(),
              SizedBox(height: 15,),
              CustomButton(
                  onPressed: (){
                    changeScreen(context, AddCard());
                  },
                buttonHeight: 96,
                decorationColor: AppTheme.blue,
                buttonText: 'ADD NEW CARD',
                borderColor: AppTheme.blue,
                buttonRadius: 12,
              ),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}

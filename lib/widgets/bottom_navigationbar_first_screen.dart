import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/record_list_view.dart';
class BottomNavigationBarFirstScreen extends StatefulWidget {
  const BottomNavigationBarFirstScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarFirstScreenState createState() => _BottomNavigationBarFirstScreenState();
}

class _BottomNavigationBarFirstScreenState extends State<BottomNavigationBarFirstScreen> {
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
                  child: Center(child: Text('Hello! James', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 16, color: AppTheme.dark_blue),)),
                ),
                Spacer(),
                Container(
                  height: 22,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.grey.withOpacity(0.1),
                  ),
                  child: Center(child: Text('All Cards', style: TextStyle(fontSize: 13, fontFamily: "Lato", fontWeight: FontWeight.w300, color: AppTheme.dark_blue),)),
                ),
              ],
            ),
            SizedBox(height: 17),
            Container(
              height: 190,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage( 'assets/card.png',),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
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
                  Container(
                    height: 56,
                    width: double.maxFinite,
                    color: AppTheme.grey.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('N5,400,000.05', style: TextStyle(fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.5)),),
                            Text('300p', style: TextStyle(fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.5)),),
                            Text('300,000', style: TextStyle(fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.5)),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Card Balance', style: TextStyle(fontSize: 12.16, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                            Text('Point Balance', style: TextStyle(fontSize: 12.16, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                            Text('Expenses', style: TextStyle(fontSize: 12.16, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  Container(
                    height: 54,
                    width: double.maxFinite,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
                        child: CustomButton(
                          decorationColor: AppTheme.dark_blue,
                          onPressed: (){},
                          buttonHeight: 31,
                          buttonText: 'Deposit',
                          labelFontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26,),
            Row(
              children: [
                CustomButton(
                  buttonWidth: MediaQuery.of(context).size.width / 4,
                  decorationColor: AppTheme.white,
                  buttonHeight: 32,
                  onPressed: (){},
                  buttonText: 'This Week',
                  buttonTextColor: AppTheme.dark_blue,
                  labelFontSize: 13,
                ),
                Spacer(),
                CustomButton(
                  labelFontSize: 13,
                  buttonWidth: MediaQuery.of(context).size.width / 4,
                  decorationColor: AppTheme.white,
                  buttonHeight: 32,
                  buttonText: 'Export as PDF',
                  buttonTextColor: AppTheme.dark_blue,
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 654,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     itemCount: ButtonText.buttonTextLabel.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (BuildContext context, int index) {
              //         return CustomButton(
              //           decorationColor: AppTheme.dark_blue,
              //           textColor: AppTheme.dark_blue,
              //             buttonHeight: 32,
              //             buttonText: ButtonText.buttonTextLabel[index].buttonText!,
              //             onPressed: (){}
              //         );
              //       }
              //   ),
              child: RecordListView(),
            ),
          ],
        ),
      ),
    );
  }
}

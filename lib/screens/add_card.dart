import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/Services/payment_card.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/card_validation_input_formatter.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/add_added_successfully.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;
  var _token;

  TextEditingController _cardNumberController = TextEditingController();

  void fetchToken() async {
    final SharedPreferences getToken = await SharedPreferences.getInstance();
    setState(() {
      _token = (getToken.getString("token"));
    });
  }

  @override
  void initState() {
    fetchToken();
    _paymentCard.type = CardType.Others;
    _cardNumberController.addListener(_getCardTypeFrmNumber);
    super.initState();
  }

  void checkAddNowConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      signUpNow();
    } else {
      alertBar(context, "No Internet Connection", AppTheme.red);
    }
  }

  void signUpNow() {
    //if (_formKey.currentState!.validate()){
    // _formKey.currentState!.save();
    addCardNow();
    //}
  }

  addCardNow() async {
    context.loaderOverlay.show();
    await HttpService()
        .addCard(_cardNumberController.text.trim(), _token)
        .then((value) async {
      if (value.statusCode == 200 || value.statusCode == 201) {
        context.loaderOverlay.hide();
        replaceScreen(context, CardAddedSuccessfully());
      }
    }).catchError((error) {
      context.loaderOverlay.hide();
      alertBar(context, error.toString(), AppTheme.red);
      print(error.code);
    }).timeout(Duration(seconds: 20), onTimeout: () {
      context.loaderOverlay.hide();
      alertBar(context, "Network timeout! Try again.", AppTheme.red);
      return null;
    });
  }

  Widget addCardWidget() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'Card Number',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Nunito',
                  fontSize: 12,
                  color: AppTheme.dark_blue),
            ),
            SizedBox(
              height: 3,
            ),
            CustomFormField(
              onSaved: (String? value) {
                print('onSaved = $value');
                print('Num controller has = ${_cardNumberController.text}');
                _paymentCard.number = CardUtils.getCleanedNumber(value!);
              },
              //validator: CardUtils.validateCardNum,
              keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.digitsOnly, new LengthLimitingTextInputFormatter(19),
              //   new CardNumberInputFormatter()],
              filled: true,
              elevation: 0.0,
              controller: _cardNumberController,
              backgroundColor: AppTheme.white,
              textInputAction: TextInputAction.next,
              enabledBorderColor: AppTheme.grey.withOpacity(0.4),
              focusedBorderColor: AppTheme.grey.withOpacity(0.4),
              height: 46,
              labelText: '4287 8874 9511 3263',
              textColor: AppTheme.grey.withOpacity(0.4),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppTheme.dark_blue.withOpacity(0.1)),
                  child: CardUtils.getCardIcon(_paymentCard.type),
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            CustomButton(
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 5,
                buttonText: 'Add',
                buttonHeight: 48,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _validateInputs();
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppTheme.backGround,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppTheme.dark_blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: SpinKitCubeGrid(
                color: AppTheme.blue,
                size: 50.0,
              ),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      addCardWidget(),
                    ],
                  ),
                )),
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    //_cardNumberController.removeListener(_getCardTypeFrmNumber);
    _cardNumberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(_cardNumberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    //final FormState form = _formKey.currentState!;
    //if (!form.validate()) {
    //setState(() {
    //_autoValidateMode = AutovalidateMode.always;
    // Start validating on every change.
    // });
    //_showInSnackBar('Please fix the errors in red before submitting.');
    //} else {
    //form.save();
    checkAddNowConnectivity();
    // Encrypt and send send payment details to payment gateway
    //_showInSnackBar('Payment card is valid');
    //}
  }

  void _showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }
}

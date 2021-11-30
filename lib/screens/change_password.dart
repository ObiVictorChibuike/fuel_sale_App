import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_added_successfully.dart';

class ChangePasswordSetting extends StatefulWidget {
  const ChangePasswordSetting({Key? key}) : super(key: key);

  @override
  _ChangePasswordSettingState createState() => _ChangePasswordSettingState();
}

class _ChangePasswordSettingState extends State<ChangePasswordSetting> {
  final _formKey = GlobalKey<FormState>();
  var _token;

  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmedPasswordController = TextEditingController();

  late bool? isSwitchNotificationOn = false;
  late bool? isSwitchSMSOn = false;
  late bool? isSwitchUpdatePromptOn = false;

  void fetchToken() async {
    final SharedPreferences getToken = await SharedPreferences.getInstance();
    setState(() {
      _token = (getToken.getString("token"));
    });
  }

  @override
  void initState() {
    fetchToken();
    super.initState();
  }

  void updatePassword() {
    //if (_formKey.currentState!.validate()){
    // _formKey.currentState!.save();
    updatePasswordNow();
    //}
  }

  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  updatePasswordNow() async {
    context.loaderOverlay.show();
    await HttpService()
        .updatePassword(
            _currentPasswordController.text.trim(),
            _newPasswordController.text.trim(),
            _confirmedPasswordController.text.trim(),
            _token)
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
                            'Update Password',
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
          body: LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: SpinKitCubeGrid(
                color: AppTheme.blue,
                size: 50.0,
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 58, bottom: 58),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 26),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 48,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21,
                                  color: AppTheme.dark_blue),
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            CustomFormField(
                                keyboardType: TextInputType.visiblePassword,
                                labelText: 'Current Password',
                                focusedBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                enabledBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                backgroundColor: AppTheme.white,
                                height: 50,
                                controller: _currentPasswordController,
                                validator: (value) {}),
                            SizedBox(
                              height: 27,
                            ),
                            CustomFormField(
                                labelText: 'New Password',
                                focusedBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                enabledBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                backgroundColor: AppTheme.white,
                                height: 50,
                                validator: (value) {}),
                            SizedBox(
                              height: 27,
                            ),
                            CustomFormField(
                                labelText: 'Confirm Password',
                                focusedBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                enabledBorderColor:
                                    AppTheme.grey.withOpacity(0.5),
                                backgroundColor: AppTheme.white,
                                height: 50,
                                validator: (value) {}),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: CustomButton(
                                  decorationColor: AppTheme.dark_blue,
                                  buttonHeight: 36,
                                  buttonText: 'Save Settings',
                                  textColor: AppTheme.white,
                                  onPressed: () {
                                    checkConnectivity();
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      updatePassword();
    } else {
      alertBar(context, "No Internet Connection", AppTheme.red);
    }
  }
}

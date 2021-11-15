
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:ndialog/ndialog.dart';

class CustomProgressDialog{
  late NAlertDialog dialog;

  showDialog(BuildContext context, String message) {
    dialog = NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Text("Please wait"),
      content: Row(
        children: [
          CupertinoActivityIndicator(radius: 20,),
          SizedBox(width: 10,),
          Text(message),
        ],
      ),
      blur: 2,
      dismissable: false,
    );
    dialog.show(context, transitionType: DialogTransitionType.Shrink);
  }

  popCustomProgressDialogDialog(BuildContext context){
    Navigator.of(context).pop();
  }

}

// NDialog(
// dialogStyle: DialogStyle(titleDivider: true),
// title: Text("Hi, This is NDialog"),
// content: Text("And here is your content, hoho... "),
// actions: <Widget>[
// TextButton(
// child: Text("You"),
// onPressed: () {},
// ),
// TextButton(
// child: Text("Are"),
// onPressed: () {},
// ),
// TextButton(
// child: Text("Awesome"),
// onPressed: () {},
// )
// ],
// ).show(
//     context,
//     );
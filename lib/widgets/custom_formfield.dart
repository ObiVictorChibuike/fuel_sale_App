import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

//Custom FormField
class CustomFormField extends StatelessWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? height;
  final Color? backgroundColor;
  final double? width;
  final double? elevation;
  const CustomFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.suffixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.height, this.backgroundColor, this.width, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor ?? AppTheme.white,
        ),
        width: width ?? double.maxFinite,
        height: height ?? 66,
        child: TextFormField(
          controller: controller,
          textCapitalization: TextCapitalization.words,
          cursorHeight: cursorHeight ?? 22.0,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: enabledBorderColor ?? AppTheme.black, width: 0.7)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: focusedBorderColor ?? AppTheme.black, width: 0.7)),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              isDense: true,
              contentPadding: EdgeInsets.all(15),
              labelText: labelText,
              labelStyle:
              TextStyle(color: textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
          cursorColor: cursorColor ?? AppTheme.black,
          validator: validator,
        ),
      ),
    );
  }
}

//Password FormField
class CustomPasswordFormField extends StatefulWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? elevation;
  const CustomPasswordFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.width, this.height, this.backgroundColor, this.elevation}) : super(key: key);

  @override
  _CustomPasswordFormFieldState createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: widget.elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.backgroundColor ?? AppTheme.white,
        ),
        height: widget.height ?? 66,
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          controller: widget.controller,
          textCapitalization: TextCapitalization.words,
          obscureText: isObscured,
          cursorHeight: widget.cursorHeight ?? 22.0,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: widget.enabledBorderColor ?? AppTheme.black, width: 0.7)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: widget.focusedBorderColor ?? AppTheme.black, width: 0.7)),
              prefixIcon: widget.prefixIcon,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility, size: 20, color: AppTheme.grey,),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(15),
              labelText: widget.labelText,
              labelStyle:
              TextStyle(color: widget.textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
          cursorColor: widget.cursorColor ?? AppTheme.black,
          validator: widget.validator,
        ),
      ),
    );
  }
}

//Bank CV2 Password FormField
class CustomCV2PasswordFormField extends StatefulWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? elevation;
  const CustomCV2PasswordFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.width, this.height, this.backgroundColor, this.elevation}) : super(key: key);

  @override
  _CustomCV2PasswordFormFieldState createState() => _CustomCV2PasswordFormFieldState();
}

class _CustomCV2PasswordFormFieldState extends State<CustomCV2PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: widget.elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.backgroundColor ?? AppTheme.white,
        ),
        height: widget.height ?? 66,
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          controller: widget.controller,
          textCapitalization: TextCapitalization.words,
          obscureText: true,
          cursorHeight: widget.cursorHeight ?? 22.0,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: widget.enabledBorderColor ?? AppTheme.black, width: 0.7)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: widget.focusedBorderColor ?? AppTheme.black, width: 0.7)),
              prefixIcon: widget.prefixIcon,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration: BoxDecoration( color: AppTheme.dark_blue.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),child: Icon(Icons.error, color: AppTheme.dark_blue,)),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(15),
              labelText: widget.labelText,
              labelStyle:
              TextStyle(color: widget.textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
          cursorColor: widget.cursorColor ?? AppTheme.black,
          validator: widget.validator,
        ),
      ),
    );
  }
}

//Custom ReadOnly FormField
class CustomReadOnlyFormField extends StatelessWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? height;
  final Color? backgroundColor;
  final double? width;
  final Color? shadowColor;
  final String? initialValue;
  final double? elevation;
  const CustomReadOnlyFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.suffixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.height, this.backgroundColor, this.width, this.initialValue, this.shadowColor, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor ?? AppTheme.backGround,
        ),
        width: width ?? double.maxFinite,
        height: height ?? 66,
        child: TextFormField(
          initialValue: initialValue,
          readOnly: true,
          controller: controller,
          textCapitalization: TextCapitalization.words,
          cursorHeight: cursorHeight ?? 22.0,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: enabledBorderColor ?? AppTheme.black, width: 0.7)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: focusedBorderColor ?? AppTheme.black, width: 0.7)),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              isDense: true,
              contentPadding: EdgeInsets.all(15),
              labelText: labelText,
              labelStyle:
              TextStyle(color: textColor ?? AppTheme.grey.withOpacity(0.2), fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
          cursorColor: cursorColor ?? AppTheme.black,
          validator: validator,
        ),
      ),
    );
  }
}
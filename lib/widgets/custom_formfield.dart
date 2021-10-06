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
  const CustomFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.suffixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.white,
      ),
      height: 66,
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
  const CustomPasswordFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller}) : super(key: key);

  @override
  _CustomPasswordFormFieldState createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.white,
      ),
      height: 66,
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
    );
  }
}
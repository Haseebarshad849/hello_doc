import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function validator;
  final Function onChanged;
  final String hintText;
  final String labelText;
  String initialValue;
  Icon prefixIcon;
  TextInputType keyboardType;
  bool obscureText;
  int maxLines;

  CustomTextFormField({
    @required this.onChanged,
    @required this.hintText,
    @required this.labelText,
    this.initialValue,
    this.validator,
    this.prefixIcon,
    this.obscureText=false,
    this.keyboardType=TextInputType.name,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          errorStyle: TextStyle(
            color: Colors.red[600],
            fontSize: 15.0,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red[500],
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red[500],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              )),
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.black26),
          labelStyle: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
        style: TextStyle(fontSize: 18.0),
        maxLines: maxLines,
      ),
    );
  }
}

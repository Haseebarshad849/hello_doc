import 'package:date_time_picker/date_time_picker.dart' as tp;
import 'package:flutter/material.dart';

class TimeFieldWidget extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final String initialValue;

  TimeFieldWidget({Key key, this.labelText, this.onChanged,this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        child: tp.DateTimePicker(
          decoration: InputDecoration(
            focusColor: Theme.of(context).accentColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black54,),
          ),
          type: tp.DateTimePickerType.time,
          onChanged: onChanged,
          initialValue: initialValue,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';

class GenderSelectionWidget extends StatelessWidget {

  var groupValue;
  ValueChanged? onChanged;
  int? value;

  GenderSelectionWidget(this.groupValue,this.onChanged,this.value);
  @override
  Widget build(BuildContext context) {
    return Radio(
      activeColor: primaryColor,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

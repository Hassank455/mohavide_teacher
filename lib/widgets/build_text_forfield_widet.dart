import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';

class BuildTextFormFieldWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextInputType? keyboardType = TextInputType.text;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  String? labelText;
  String? hintText;
  VoidCallback? suffixPressed;
  IconData? suffix;
  IconData? prefix;
  bool? isPassword = false;

  BuildTextFormFieldWidget(
      {required this.controller,
        this.labelText,
        this.hintText,
      this.keyboardType,
        this.isPassword,
      this.onChanged,
      this.validator,
      this.suffixPressed,
      this.suffix,
        this.prefix,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
          suffixIcon: IconButton(
             onPressed: suffixPressed, icon: Icon(suffix),color: primaryColor,
          ),
          prefixIcon: Icon(
          prefix,color: Colors.grey,
          ),
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.w, color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.w, color: primaryColor),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}


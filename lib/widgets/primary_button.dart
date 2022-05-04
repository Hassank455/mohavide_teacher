import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';

class PrimaryButton extends StatelessWidget {
  GestureTapCallback? onTap;
  String? text;
  double? width = 300.w;
  double? height = 60.w;
  PrimaryButton({this.onTap, this.text, this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15.h)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20.w),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text!,style: TextStyle(color: Colors.white,fontSize: 20.sp),),
            ),

            Icon(Icons.arrow_forward,color: Colors.white,),


          ],
        ),
      ),
    );
  }
}

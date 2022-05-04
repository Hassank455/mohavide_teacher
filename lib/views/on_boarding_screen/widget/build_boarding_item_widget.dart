import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/on_boarding_screen.dart';

class BuildBoardingItemWidget extends StatelessWidget {

  BoardingModel model;

  BuildBoardingItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('${model.image}')
          ,width: double.infinity,
          height: 400.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 40.0.h,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 24.0.sp,
            fontWeight: FontWeight.bold,
            color: primaryColor
          ),
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Container(
          width: 300.w,
          child: Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 16.0.sp,
              color: Colors.grey
            ),textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 30.0.h,
        ),
      ],
    );
  }
}

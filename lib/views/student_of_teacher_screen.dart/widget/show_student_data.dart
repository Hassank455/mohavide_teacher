import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';

Widget showStudentData({
  String? preservation,
  String? evaluation,
  String? description,
  String? homeWork,
  String? audience,
  String? date,
}){
  return Container(
    padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h,bottom: 20.h),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200]
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('التاريخ',style: TextStyle(fontSize: 16),),
            Text(date ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ما حفظه الطالب',style: TextStyle(fontSize: 16),),
            Text(preservation ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('تقييم ما تم حفظه',style: TextStyle(fontSize: 16),),
            Text(evaluation ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ملاحظات عن الطالب',style: TextStyle(fontSize: 16),),
            Text(description ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الواجب البيتي',style: TextStyle(fontSize: 16),),
            Text(homeWork ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الحضور',style: TextStyle(fontSize: 16),),
            Text(audience ?? '',style: TextStyle(fontSize: 16,color: Colors.grey),),
          ],
        ),
      ],
    ),
  );
}
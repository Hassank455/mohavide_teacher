import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container buildLabelInProfile(String title,String subtitle,IconData icon) {
  return Container(
    width: 360.w,
    height: 90.h,
    //color: Colors.red,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100]
    ),
    child: ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(icon,size: 40,),
        ],
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
}
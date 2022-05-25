import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/add_data_student_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/widgets/listTile_profile.dart';

class StudentProfile extends StatelessWidget {
  Map? data = {};

  StudentProfile({this.data});

  @override
  Widget build(BuildContext context) {
    print('data Profile');
    print(data);
    print(data?['image']);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
     /*   appBar: AppBar(
          title: Text(
            'بروفايل الطالب ${data?['nameOfStudent']} ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
          elevation: 0,
        ),*/

        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Container(
                height: 290.h,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/profileStudents.png',
                      width: double.infinity,
                      height: 230.h,
                      fit: BoxFit.cover,
                    ),

                  ],
                ),
              ),*/
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      data?['image'] ?? ''),
                  radius: 80.w,
                ),
              ),
              SizedBox(height: 30.h),
              buildLabelInProfile('اسم الطالب', data?['nameOfStudent']  ?? '',Icons.person),
              SizedBox(height: 20.h),
              buildLabelInProfile('اسم ولي الامر', data?['nameOfGuardian']   ?? '',Icons.perm_contact_cal),
              SizedBox(height: 20.h),
              buildLabelInProfile('الجنس', data?['gender']   ?? '',Icons.male ),
              SizedBox(height: 20.h),
              buildLabelInProfile('المرحلة الدراسية',  data?['educationalLevel']  ?? '',Icons.book),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_data_details.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_profile.dart';

class StudentTabs extends StatelessWidget {
  Map? data = {};

  StudentTabs({this.data});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: Text(' بيانات الطالب ${data?['nameOfStudent']}'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_forward)),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("بيانات الطالب"),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.biotech),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("بروفايل الطالب"),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.person),
                  ],
                ),
              ),

            ],
          ),
        ),
        body:  TabBarView(
          children: [

            StudentDataDetails(uId: data?['uId']),
            StudentProfile(data: data),
          ],
        ),
      ),
    );

  }

}

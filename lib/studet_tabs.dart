import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/student_profile.dart';
import 'package:mohavide_teacher/students_details.dart';

class StudentTabs extends StatelessWidget {
  const StudentTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Text('بيانات الطالب '),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_forward)),
          ],
          centerTitle: true,
          bottom: TabBar(
            tabs: [


              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("بروفايل المحفظ"),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.person),
                  ],
                ),
              ),
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
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Student_Profile(),
            StudentDetails(),
          ],
        ),
      ),
    );

  }

}


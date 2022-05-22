import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/add_data_student_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/show_student_data.dart';

class StudentDataDetails extends StatelessWidget {

  String? uId;
  StudentDataDetails({this.uId});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => AddDataForStudentScreen(uId: uId,)));
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          elevation: 2.0,
          tooltip: "اضغط للاضافة",
          backgroundColor: primaryColor,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('students')
              .doc(uId).snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            if (snapshot.data['dataStudent'] == null || snapshot.data['dataStudent'].isEmpty
                || snapshot.data['dataStudent'].length == 0) {
              return const Center(
                child: Text('لا يوجد بيانات'),
              );
            }

              return ListView(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data?['dataStudent'].map<Widget>((document) {
                  return showStudentData(
                    preservation: document['preservation'],
                    description: document['description'],
                    audience:document['audience'] ,
                    evaluation: document['evaluation'],
                    homeWork: document['homeWork'],
                    date: document['date'],
                  );
                }).toList(),
              );


          },
        ),
      ),
    );
  }
}

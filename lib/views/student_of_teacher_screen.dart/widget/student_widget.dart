import 'package:flutter/material.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_profile.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/students_tabs_screen.dart';

Widget StudentWidget({String? name, String? image, String? nameGuration,context,Map? data}) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentTabs(data: data)/*StudentProfile(
          data: data,
        ),*/
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[100],
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),

                        spreadRadius: 5,

                        blurRadius: 7,

                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${name ?? ''}',
                        style: TextStyle(
                            fontSize: 16, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ${nameGuration ?? ''}  ',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(onPressed: () {}, icon: (Icon(Icons.print)))),
          ],
        ),
      ),
    );

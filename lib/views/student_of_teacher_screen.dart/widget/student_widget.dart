import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_profile.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/students_tabs_screen.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

Widget StudentWidget(
        {String? name,
        String? uId,
        String? image,
        String? nameGuration,
        context,
        Map? data}) =>
    GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StudentTabs(data: data)));
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
                child: IconButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('students')
                        .doc(uId)
                        .get()
                        .then((value) async {
                      final excel.Workbook workbook = excel.Workbook();
                      final excel.Worksheet sheet = workbook.worksheets[0];
                      sheet.getRangeByName('A1').setText('اسم الطالب');
                      sheet.getRangeByName('B1').setText('التاريخ');
                      sheet.getRangeByName('C1').setText('ما تم حفظه');
                      sheet.getRangeByName('D1').setText('تقييم الحفظ');
                      sheet.getRangeByName('E1').setText('وصف وملاحظات');
                      sheet.getRangeByName('F1').setText('الواجب البيتي');
                      sheet.getRangeByName('G1').setText('الحضور والغياب');
                      sheet.getRangeByName('A2').setText(name);
                      int index = 2;
                      if(value.data()?['dataStudent'] == null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('لا يوجد بيانات للطالب '),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }else{
                        for (var row in value.data()?['dataStudent']) {
                          sheet.getRangeByName('B$index').setText(row['date']);
                          sheet.getRangeByName('C$index').setText(
                            row['preservation'],
                          );
                          sheet.getRangeByName('D$index').setText(
                            row['evaluation'],
                          );
                          sheet.getRangeByName('E$index').setText(
                            row['description'],
                          );
                          sheet
                              .getRangeByName('F$index')
                              .setText(row['homeWork']);
                          sheet.getRangeByName('G$index').setText(
                            row['audience'],
                          );
                          index++;
                        }

                        final List<int> bytes = workbook.saveAsStream();
                        workbook.dispose();

                        final String path =
                            (await getApplicationDocumentsDirectory()).path;
                        final String fileName = '$path/Output.xlsx';
                        final File file = File(fileName);
                        await file.writeAsBytes(bytes, flush: true);
                        OpenFile.open(fileName);
                      }

                    });
                  },
                  icon: (Icon(Icons.print, color: Colors.grey)),
                )),
          ],
        ),
      ),
    );

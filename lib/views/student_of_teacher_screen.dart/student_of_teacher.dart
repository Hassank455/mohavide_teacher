import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/search_students_screen.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_profile.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_widget.dart';
import 'package:mohavide_teacher/widgets/primary_button.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
class StudentOfTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                title: Text(
                  'طلاب المحفظ ${HomeScreenCubit.get(context).data?['name'] ?? ''}',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                actions: [

                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_)=> SearchStudentsScreen()));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ],
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.all(20),
                child: PrimaryButton(
                  onTap: () async{

                      final excel.Workbook workbook = excel.Workbook();
                      final excel.Worksheet sheet = workbook.worksheets[0];
                      sheet.getRangeByName('A1').setText('اسم الطالب');
                      sheet.getRangeByName('B1').setText('التاريخ');
                      sheet.getRangeByName('C1').setText('ما تم حفظه');
                      sheet.getRangeByName('D1').setText('تقييم الحفظ');
                      sheet.getRangeByName('E1').setText('وصف وملاحظات');
                      sheet.getRangeByName('F1').setText('الواجب البيتي');
                      sheet.getRangeByName('G1').setText('الحضور والغياب');

                      int index = 2;
                      if(HomeScreenCubit.get(context).allDataS == null || HomeScreenCubit.get(context).allDataS!.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('لا يوجد بيانات للطالب '),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }else{
                       // print('ssssssssssss');
                      //  print(HomeScreenCubit.get(context).allDataS![2]['dataStudent']);
                        for (var row = 0; row < HomeScreenCubit.get(context).allDataS!.length; row++) {
                          for(var row2 in HomeScreenCubit.get(context).allDataS?[row]['dataStudent']){
                             sheet.getRangeByName('A$index').setText(HomeScreenCubit.get(context).allDataS?[row]['nameOfStudent']);
                            sheet.getRangeByName('B$index').setText(row2['date']);
                            sheet.getRangeByName('C$index').setText(
                              row2['preservation'],
                            );
                            sheet.getRangeByName('D$index').setText(
                              row2['evaluation'],
                            );
                            sheet.getRangeByName('E$index').setText(
                              row2['description'],
                            );
                            sheet
                                .getRangeByName('F$index')
                                .setText(row2['homeWork']);
                            sheet.getRangeByName('G$index').setText(
                              row2['audience'],
                            );
                             index++;
                          }

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





                  },
                  text: 'طباعة تقرير لجميع الطلاب',
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'قائمة الطلاب المسجلين لدي',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      (HomeScreenCubit.get(context).allDataS!.isEmpty ||
                              HomeScreenCubit.get(context).allDataS?.length ==
                                  null)
                          ? const Center(
                              child: Text('لا يوجد طلاب'),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => StudentWidget(
                                data: HomeScreenCubit.get(context)
                                  .allDataS?[index],
                                    context: context,
                                    name: HomeScreenCubit.get(context)
                                        .allDataS?[index]['nameOfStudent'],
                                    uId: HomeScreenCubit.get(context)
                                        .allDataS?[index]['uId'],
                                    image: HomeScreenCubit.get(context)
                                        .allDataS?[index]['image'],
                                    nameGuration: HomeScreenCubit.get(context)
                                        .allDataS?[index]['nameOfGuardian'],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount: HomeScreenCubit.get(context)
                                  .allDataS!
                                  .length),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

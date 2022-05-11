import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/gender_selection_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/widgets/primary_button.dart';


class AddDataForStudentScreen extends StatefulWidget {

  String? uId;
  AddDataForStudentScreen({this.uId});

  @override
  State<AddDataForStudentScreen> createState() => _AddDataForStudentScreenState();
}

class _AddDataForStudentScreenState extends State<AddDataForStudentScreen> {
  TextEditingController preservationController = TextEditingController();

  TextEditingController evaluationController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController homeWorkController = TextEditingController();

  var _formKey = GlobalKey<FormState>(debugLabel: 'add');

  @override
  void initState() {
    super.initState();
    HomeScreenCubit.get(context).selectedValue = 0;
  }
  @override
  Widget build(BuildContext context) {
    print(widget.uId);
    print('${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {
          if(state is AddDataForStudentSuccessState){
            Navigator.pop(context);
          }
    }, builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                title: Text('بيانات الطالب '),

                centerTitle: true,
              ),

              body:  SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      TextFormField(controller: preservationController,
                        decoration:  const InputDecoration(
                          prefixIcon: Icon(Icons.save),
                          labelText: 'ما تم حفظه',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل ما تم حفظه';
                          }
                        },
                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        controller: evaluationController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.details),
                          labelText: ' تقييم ما تم حفظه',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل تقييم ما تم حفظه';
                          }
                        },
                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.work ,),
                          labelText: 'ملاحظات عن الطالب',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),

                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل ملاحظات عن الطالب';
                          }
                        },
                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        controller: homeWorkController,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.work ,),
                          labelText: ' وصف الواجب البيتي ',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),

                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الواجب البيتي';
                          }
                        },
                      ),
                      SizedBox(height: 20.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'حضور',
                            style:
                            TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                          ),
                          GenderSelectionWidget(
                              HomeScreenCubit.get(context).selectedValue,
                                  (value) {
                                    HomeScreenCubit.get(context)
                                    .setSelectedRadio(value!);
                              }, 1),
                          Text('غياب',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey[700])),
                          GenderSelectionWidget(
                              HomeScreenCubit.get(context).selectedValue,
                                  (value) {
                                    HomeScreenCubit.get(context)
                                    .setSelectedRadio(value!);
                              }, 2),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      (state is AddDataForStudentLoadingState)
                          ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ))
                          : PrimaryButton(
                        text: 'اضافة',
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              HomeScreenCubit.get(context).selectedValue != 0) {
                            if (HomeScreenCubit.get(context)
                                .selectedValue ==
                                1) {
                              HomeScreenCubit.get(context).addDataForStudent(
                                uId: widget.uId,
                                preservation: preservationController.text,
                                evaluation: evaluationController.text,
                                description: descriptionController.text,
                                homeWork: homeWorkController.text,
                                audience: 'حضور',
                                date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',

                              );

                            } else {
                              HomeScreenCubit.get(context).addDataForStudent(
                                uId: widget.uId,
                                preservation: preservationController.text,
                                evaluation: evaluationController.text,
                                description: descriptionController.text,
                                homeWork: homeWorkController.text,
                                audience: 'غياب',
                                  date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                              );

                            }
                          }

                          if (HomeScreenCubit.get(context).selectedValue ==
                              0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('من فضلك ادخل الجنس '),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        height: 60.h,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ),
          );
    }
    );

  }
}


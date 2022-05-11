import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_profile.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_widget.dart';

class StudentOfTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              title: Text(
                'طلاب المحفظ محمود أحمد',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )),
              ],
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
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
                              itemBuilder: (context, index) => StudentWidget(data: HomeScreenCubit.get(context)
                                  .allDataS?[index],
                                    context: context,
                                    name: HomeScreenCubit.get(context)
                                        .allDataS?[index]['nameOfStudent'],
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

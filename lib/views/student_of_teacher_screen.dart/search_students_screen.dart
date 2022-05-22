import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/widget/student_widget.dart';

class SearchStudentsScreen extends StatelessWidget {
  static final _abcKey = Key('search');

  TextEditingController searchController = TextEditingController();
  dynamic? searchData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.black,
                title: Text(
                  'بحث عن طالب',
                  style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        onChanged: (value1) {

                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يجب ادخال نص';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                HomeScreenCubit.get(context)
                                    .getSearch(searchController.text)
                                    .then((value) {
                                  HomeScreenCubit.get(context)
                                      .changeSnapshotData(value);
                                });
                              },
                              icon: Icon(Icons.search),
                            ),
                            hintText: ' إبحث عن الطالب الذي تريده ... ',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.w, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3.w, color: primaryColor),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                      (HomeScreenCubit.get(context).searchData != null ||
                              HomeScreenCubit.get(context)
                                  .searchData!
                                  .isNotEmpty)
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: HomeScreenCubit.get(context)
                                  .searchData
                                  ?.length,
                              itemBuilder: (context, index) {
                                return StudentWidget(
                                  context: context,
                                  data: HomeScreenCubit.get(context)
                                      .searchData?[index],
                                  uId:HomeScreenCubit.get(context)
                                      .searchData?[index]['uId'] ,
                                  image: HomeScreenCubit.get(context)
                                      .searchData?[index]['image'],
                                  name: HomeScreenCubit.get(context)
                                      .searchData?[index]['nameOfStudent'],
                                  nameGuration: HomeScreenCubit.get(context)
                                      .searchData?[index]['nameOfGuardian'],
                                );
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

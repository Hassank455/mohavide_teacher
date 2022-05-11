import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/student_of_teacher_screen.dart/student_of_teacher.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';
import 'package:mohavide_teacher/widgets/listTile_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {
      if (state is GetDataLoadingState) {
        const Center(
          child: CircularProgressIndicator(),
        );
      }
    }, builder: (context, state) {
      print('asdasd');
      print(HomeScreenCubit.get(context).allDataS);
     // debugPrint('${HomeScreenCubit.get(context).allDataS}');
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 220.h,
                  child: DrawerHeader(
            decoration: const BoxDecoration(
              color: primaryColor
            ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${HomeScreenCubit.get(context).data?['image']}'),
                            radius: 30.w,
                          ),SizedBox(height: 5.h),
                          Text(
                            HomeScreenCubit.get(context).data?['name'] ?? '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),SizedBox(height: 5.h),
                          Text(
                            HomeScreenCubit.get(context).data?['email'] ?? '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              Text(
                                HomeScreenCubit.get(context).data?['phoneNumber'] ?? '',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary),
                              ),
                            ],
                          )

                        ],

                    ),
                  ),
                ),

                /*  UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: primaryColor,
                      ),
                      otherAccountsPicturesSize: Size(400, 100),

                      currentAccountPicture:Container(),


                      accountName: Center(
                        child: Column(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:2,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${HomeScreenCubit.get(context).data?['image']}'),
                                radius: 30.w,
                              ),
                            ),
                            Expanded(flex:1,
                              child: Text(
                              HomeScreenCubit.get(context).data?['name'] ?? '',
                        style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                    ),
                            ),
                            Expanded(flex:1,
                              child: Text(
                                HomeScreenCubit.get(context).data?['email'] ?? '',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      accountEmail: Container(),

                      // const UserAccountsDrawerHeader(
                      //   currentAccountPicture: CircleAvatar(
                      //     backgroundImage : AssetImage('assets/images/Mask.png'),
                      //     //AssetImage("assets/images/Mask.png"),
                      //   ),
                      //   accountName: Text('mnfn2000@gmail.com '),
                      //   accountEmail: Text('0598611510'),
                      // // ),
                    ),*/
                ListTile(
                  title: Text('الطلاب'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentOfTeacher()));
                  },
                ),
                ListTile(
                  title: Text('إستعراض درجات الطلاب'),
                  leading: Icon(Icons.grade),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('طباعة تقرير عن الطالب'),
                  leading: Icon(Icons.print),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('الأنشطة والدورات'),
                  leading: Icon(Icons.local_activity),
                  onTap: () {},
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'بروفايل المحفظ ${HomeScreenCubit.get(context).data?['name']}',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          body: (state is GetDataLoadingState)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/images/profilememorizers_bac.png',
                            width: double.infinity,
                            height: 260.h,
                            fit: BoxFit.cover,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${HomeScreenCubit.get(context).data?['image']}'),
                            radius: 80.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      buildLabelInProfile(
                          'اسم المحفظ',
                          '${HomeScreenCubit.get(context).data?['name']}',
                          Icons.perm_contact_cal),
                      SizedBox(height: 20.h),
                      buildLabelInProfile(
                          'المرحلة الدراسية',
                          '${HomeScreenCubit.get(context).data?['educationalLevel']}',
                          Icons.book),
                      SizedBox(height: 20.h),
                      buildLabelInProfile(
                          'رقم الهاتف',
                          '${HomeScreenCubit.get(context).data?['phoneNumber']}',
                          Icons.call),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}

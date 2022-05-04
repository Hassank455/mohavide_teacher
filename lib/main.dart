import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_teacher/core/utils/BlocObserver.dart';
import 'package:mohavide_teacher/views/home_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/home_screen/home_page.dart';
import 'package:mohavide_teacher/views/login_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/login_screen/login_screen.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/on_boarding_screen.dart';
import 'package:mohavide_teacher/views/splash_screen/splash_screen.dart';
import 'package:mohavide_teacher/widgets/custom_error.dart';

import 'core/utils/contants.dart';

void main()async {

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();

  Widget widget;
  bool? splash = CacheHelper.getData(key: 'splash');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  uId = CacheHelper.getData(key: 'uid');

print(uId);

  if (splash != null) {
    if(onBoarding != null){
      if (uId != null) {
        widget = Home_page();
      } else {
        widget = LoginScreen();
      }

    }else{
      widget = OnBoardingScreen();
    }

  } else {
    widget = SplashScreen();
  }

  BlocOverrides.runZoned(
        () {
      customError();
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  MyApp({
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeScreenCubit()..getAllData(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: Size(392, 872),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
               // fontFamily: "PNU",
              //  textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30.sp)),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.green,
                ),
              ),
              home: startWidget,
            );
          }),
    );
  }
}

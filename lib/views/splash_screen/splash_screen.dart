import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/on_boarding_screen.dart';

import '../../core/sharedHelper/shared_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void submit() {
    CacheHelper.saveData(
      key: 'splash',
      value: true,
    ).then((value) {
      if (value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      submit();
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash.png',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
    );
  }
}

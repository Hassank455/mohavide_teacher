import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_teacher/views/login_screen/login_screen.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/state/state.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/widget/build_boarding_item_widget.dart';
import 'package:mohavide_teacher/widgets/primary_button.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {

  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onBoardingtest.png',
      title: 'متابعة ولي الأمر لإبنه',
      body: 'تطبيق يمكن ولي الأمر من متابعة ما يأخذه إبنه في مركز التحفيظ وبالتالي معرفة كل ما يتعلق في ولده من حفظ القرآن وغيره ',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding2.png',
      title: 'كتابة ملاحظات الطالب',
      body: 'تطبيق يقوم من خلاله المحفظ بكتابة كل ما يخص الطالب من تحفيظ أو تقييم أو غيره',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding3.png',
      title: 'سهولة معرفة تقييمات الطالب',
      body: 'حيث يمكن من خلال التطبيق طباعة تقرير كامل فيما يخص تقييمات ودرجات الطالب وغيره ',
    ),
  ];

  void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
              (route) {
            return false;
          },
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
        builder: (context, state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: boardController,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        OnBoardingCubit.get(context).changeIsLast();
                      } else {
                        OnBoardingCubit.get(context).isLast = false;
                      }
                    },
                    itemBuilder: (context, index) {
                      OnBoardingCubit.get(context).changeIndex(index);
                      return BuildBoardingItemWidget(boarding[index]);
                    },

                    itemCount: boarding.length,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                PrimaryButton(onTap: (){
                  if (OnBoardingCubit.get(context).isLast) {
                    submit(context);
                  } else {
                    boardController.nextPage(
                      duration: Duration(
                        milliseconds: 1050,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );

                  }
                }, text: 'استمر',width: 340.w,),


                (OnBoardingCubit.get(context).indexlength != 2) ? TextButton(
                  onPressed: (){
                    submit(context);
                  },
                  child: Text('تخطي',style: TextStyle(color: Colors.grey,fontSize: 20.sp),),

                ) : Container(),

               SizedBox(height: 20.h),


               /* Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: primaryColor,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      count: boarding.length,
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (OnBoardingCubit.get(context).isLast) {
                          submit(context);
                        } else {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        );
        }

    );
  }
}

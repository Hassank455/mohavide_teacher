import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_teacher/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/login_screen/controller/controller.dart';
import 'package:mohavide_teacher/views/login_screen/states/states.dart';
import 'package:mohavide_teacher/widgets/build_text_forfield_widet.dart';
import 'package:mohavide_teacher/widgets/primary_button.dart';

import '../home_screen/home_page.dart';

class LoginScreen extends StatefulWidget {
  static var formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
            /*action: SnackBarAction(
                  label: 'UNDO', onPressed: () {  },

                ),*/
          ),
        );
      }
      if (state is LoginSuccessState) {
        CacheHelper.saveData(key: 'uid', value: state.uid).then((value) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home_page(),
            ),
            (route) {
              return false;
            },
          );
        });
      }
    }, builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: LoginScreen.formKey,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/new_login.png'),
                    width: double.infinity,
                    height: 380.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 15.h, right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اهلا بك',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 20.h),
                        BuildTextFormFieldWidget(
                          controller: emailController,
                          labelText: 'البريد الإلكتروني',
                          prefix: Icons.email,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل البريد الالكنروني';
                            }
                          },
                        ),
                        SizedBox(height: 20.h),
                        BuildTextFormFieldWidget(
                          controller: passwordController,
                          labelText: 'كلمة المرور',
                          prefix: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPasswordEdit,
                          suffixPressed: () {
                            LoginCubit.get(context)
                                .changePasswordVisibilityEdit();
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل البريد المرور';
                            }
                          },
                        ),
                        SizedBox(height: 20.h),
                        const Text(
                          'هل نسيت كلمة المرور ؟',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 30.h),
                        (state is LoginLoadingState)
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: primaryColor,
                              ))
                            : PrimaryButton(
                                onTap: () {
                                  if (LoginScreen.formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'تسجيل الدخول',
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

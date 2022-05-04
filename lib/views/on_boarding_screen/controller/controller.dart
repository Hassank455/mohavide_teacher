import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/views/on_boarding_screen/state/state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;

  void changeIsLast(){
      isLast = true;
      emit(OnBoardingChangeIsLastSuccessState());
  }

  int? indexlength;
  void changeIndex(int index){
    indexlength = index;
    emit(OnBoardingChangeIndexSuccessState());
  }

}
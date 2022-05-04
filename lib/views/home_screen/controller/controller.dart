import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);


  Map<String, dynamic>? data;
  void getAllData()async{
    emit(GetDataLoadingState());
    var querySnapshot = await FirebaseFirestore.instance
        .collection('memorizers').doc(uId).snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        data = docSnapshot.data()!;

        var name = data?['name'];
        print('4444');
        print(name);
      }
      emit(GetDataSuccessState());
    });

  }

}

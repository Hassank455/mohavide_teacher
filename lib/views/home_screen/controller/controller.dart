import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_teacher/core/utils/contants.dart';
import 'package:mohavide_teacher/views/home_screen/state/state.dart';


class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);


  Map<String, dynamic>? data;

  List? allDataS = [];

  void getAllData()async{
    emit(GetDataLoadingState());
    var querySnapshot = await FirebaseFirestore.instance
        .collection('memorizers').doc(uId).snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        data = docSnapshot.data()!;
      //  print(docSnapshot.data()!['student']);
        List? studentsUId = docSnapshot.data()?['student'];

        print('studentsUId');
        print(studentsUId);

        studentsUId?.forEach((element) async {
           await FirebaseFirestore.instance
              .collection('students').doc(element).get().then((value){
            if(value.data()!.isNotEmpty){
              allDataS?.add(value.data()!);
            }
            emit(AddDataSuccessState());
          }).catchError((e){
            print('eeeeeee');
            print(e);
           });
        });
      }
      emit(GetDataSuccessState());
    });

  }


  void addDataForStudent({
    String? uId,
    String? preservation,
    String? evaluation,
    String? description,
    String? homeWork,
    String? audience,
    String? date
  }){
    emit(AddDataForStudentLoadingState());

    Map? dataStudent = {
      'preservation': preservation,
      'evaluation': evaluation,
      'description': description,
      'audience': audience,
      'homeWork': homeWork,
      'date': date,
    };

    List? addDataStu = [];
    addDataStu.add(dataStudent);

    FirebaseFirestore.instance
        .collection('students')
        .doc(uId)
        .set({
      'dataStudent':FieldValue.arrayUnion(addDataStu)
    }, SetOptions(merge: true)).then((value) {
      emit(AddDataForStudentSuccessState());

    }).catchError((e){
      print('12345');
      print(e.toString());
      emit(AddDataForStudentErrorState(e.toString()));
    });
  }

  int? selectedValue;
  void setSelectedRadio(int val) {
    selectedValue = val;
    emit(ChangeValueRadioForAddMemorizersState());
  }



  dynamic? snapshotData;

  void changeSnapshotData(vale){
    snapshotData = vale;
    emit(ChangeValueStudentSuccessState());
  }
  dynamic? searchData = [];
  Future getSearch(String queryString) async {

      allDataS?.forEach((element) {
        if(element.containsKey("nameOfStudent")) {
          if (element["nameOfStudent"].contains(queryString)) {
            searchData?.add(element);
            emit(test());
            print('searchData');
            print(searchData);
          }
        }
      });


  /*  searchData=allDataS?.where((element) {
      print('222222');
      print(element['nameOfStudent']);
      element['nameOfStudent']
          .contains(queryString.toLowerCase())
          .toList();

      return false;
    });
    print('searchData');
    print(searchData);

    return searchData;

*/


  }



}

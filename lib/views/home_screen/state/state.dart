abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class GetDataLoadingState extends HomeScreenStates {}
class GetDataSuccessState extends HomeScreenStates {}
class AddDataSuccessState extends HomeScreenStates {}
class GetDataErrorState extends HomeScreenStates {
  final String error;

  GetDataErrorState(this.error);
}


class AddDataForStudentLoadingState extends HomeScreenStates {}
class AddDataForStudentSuccessState extends HomeScreenStates {}
class AddDataForStudentErrorState extends HomeScreenStates {
  final String error;

  AddDataForStudentErrorState(this.error);
}

class ChangeValueRadioForAddMemorizersState extends HomeScreenStates {}

class ChangeValueStudentSuccessState extends HomeScreenStates {}
class test extends HomeScreenStates {}

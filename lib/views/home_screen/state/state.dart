abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class GetDataLoadingState extends HomeScreenStates {}

class GetDataSuccessState extends HomeScreenStates {}

class GetDataErrorState extends HomeScreenStates {
  final String error;

  GetDataErrorState(this.error);
}
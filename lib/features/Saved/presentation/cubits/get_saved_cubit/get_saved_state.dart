import 'package:jobhub/features/Saved/data/models/get_saved_model/get_saved_model.dart';

abstract class GetSavedState {}

final class GetSavedInitialState extends GetSavedState {}

class GetSavedLoadingState extends GetSavedState {}

class GetSavedSuccessState extends GetSavedState {
  final GetSavedModel savedModel;

  GetSavedSuccessState(this.savedModel);
}

class GetSavedFailureState extends GetSavedState {
  final String error;

  GetSavedFailureState(this.error);
}

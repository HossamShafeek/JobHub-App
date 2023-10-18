import 'package:jobhub/features/Saved/data/models/delete_saved_model/delete_saved_model.dart';

abstract class RemoveFromSavedState {}

final class RemoveFromSavedInitialState extends RemoveFromSavedState {}

class RemoveFromSavedLoadingState extends RemoveFromSavedState {}

class RemoveFromSavedSuccessState extends RemoveFromSavedState {
  final DeleteSavedModel savedModel;

  RemoveFromSavedSuccessState(this.savedModel);
}

class RemoveFromSavedFailureState extends RemoveFromSavedState {
  final String error;

  RemoveFromSavedFailureState(this.error);
}

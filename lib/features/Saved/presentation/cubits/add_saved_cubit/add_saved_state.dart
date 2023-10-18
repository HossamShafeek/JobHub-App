import 'package:jobhub/features/Saved/data/models/add_saved_model/add_saved_model.dart';

abstract class AddToSavedState {}

final class AddToSavedInitialState extends AddToSavedState {}

class AddToSavedLoadingState extends AddToSavedState {}

class AddToSavedSuccessState extends AddToSavedState {
  final AddSavedModel savedModel;

  AddToSavedSuccessState(this.savedModel);
}

class AddToSavedFailureState extends AddToSavedState {
  final String error;

  AddToSavedFailureState(this.error);
}

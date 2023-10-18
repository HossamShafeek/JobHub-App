import 'package:jobhub/features/apply/data/models/apply_model/apply.dart';

abstract class ApplyJobState {}

class ApplyJobInitialState extends ApplyJobState {}

class ApplyJobLoadingState extends ApplyJobState {}

class ApplyJobSuccessState extends ApplyJobState {}

class ApplyJobFailureState extends ApplyJobState {
  final String error;

  ApplyJobFailureState(this.error);
}

class ChangeCurrentStepperIndexState extends ApplyJobState {}

class PickedFileSuccessState extends ApplyJobState {}

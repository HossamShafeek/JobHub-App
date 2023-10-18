import 'package:jobhub/features/apply/data/models/apply_model/apply_model.dart';

abstract class GetApplyState {}

class GetApplyInitialState extends GetApplyState {}

class GetApplyLoadingState extends GetApplyState {}

class GetApplySuccessState extends GetApplyState {
  final ApplyModel applyModel;

  GetApplySuccessState(this.applyModel);
}

class GetApplyFailureState extends GetApplyState {
  final String error;

  GetApplyFailureState(this.error);
}

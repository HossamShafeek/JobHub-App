import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

abstract class GetSuggestedJobState {}

class GetSuggestedJobInitialState extends GetSuggestedJobState {}

class GetSuggestedJobLoadingState extends GetSuggestedJobState {}

class GetSuggestedJobSuccessState extends GetSuggestedJobState {
  final Job suggestedJobModel;

  GetSuggestedJobSuccessState(this.suggestedJobModel);
}

class GetSuggestedJobFailureState extends GetSuggestedJobState {
  final String error;

  GetSuggestedJobFailureState(this.error);
}

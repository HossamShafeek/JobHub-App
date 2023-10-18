import 'package:jobhub/features/home/data/models/jobs_model/jobs_model.dart';

abstract class GetRecentlyJobsState {}

class GetRecentlyJobsInitialState extends GetRecentlyJobsState {}

class GetRecentlyJobsLoadingState extends GetRecentlyJobsState {}

class GetRecentlyJobsSuccessState extends GetRecentlyJobsState {
  final JobsModel jobsModel;

  GetRecentlyJobsSuccessState(this.jobsModel);
}

class GetRecentlyJobsFailureState extends GetRecentlyJobsState {
  final String error;

  GetRecentlyJobsFailureState(this.error);
}

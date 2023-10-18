import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/home/data/models/jobs_model/jobs_model.dart';
import 'package:jobhub/features/home/data/repository/home_repository.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_state.dart';

class GetRecentlyJobsCubit extends Cubit<GetRecentlyJobsState> {
  GetRecentlyJobsCubit(this.homeRepository)
      : super(GetRecentlyJobsInitialState());

  final HomeRepository homeRepository;

  static GetRecentlyJobsCubit get(context) => BlocProvider.of(context);

  JobsModel? jobsModel;

  Future<void> getRecentlyJobs() async {
    emit(GetRecentlyJobsLoadingState());
    Either<Failure, JobsModel> result;
    result = await homeRepository.getRecentlyJobs();
    result.fold((failure) {
      emit(GetRecentlyJobsFailureState(failure.error));
    }, (jobsModel) {
      this.jobsModel = jobsModel;
      emit(GetRecentlyJobsSuccessState(jobsModel));
    });
  }
}

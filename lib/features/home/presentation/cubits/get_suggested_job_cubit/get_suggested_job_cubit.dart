import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/data/repository/home_repository.dart';
import 'package:jobhub/features/home/presentation/cubits/get_suggested_job_cubit/get_suggested_job_state.dart';

class GetSuggestedJobCubit extends Cubit<GetSuggestedJobState> {
  GetSuggestedJobCubit(this.homeRepository)
      : super(GetSuggestedJobInitialState());

  final HomeRepository homeRepository;

  static GetSuggestedJobCubit get(context) => BlocProvider.of(context);

  Job? suggestedJobModel;

  Future<void> getGetSuggested() async {
    emit(GetSuggestedJobLoadingState());
    Either<Failure, Job> result;
    result = await homeRepository.getSuggestedJob();
    result.fold((failure) {
      emit(GetSuggestedJobFailureState(failure.error));
    }, (suggestedJobModel) {
      this.suggestedJobModel = suggestedJobModel;
      emit(GetSuggestedJobSuccessState(suggestedJobModel));
    });
  }
}

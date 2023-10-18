import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply_model.dart';
import 'package:jobhub/features/apply/data/repository/apply_repository.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_state.dart';

class GetApplyCubit extends Cubit<GetApplyState> {
  GetApplyCubit(this.applyRepository) : super(GetApplyInitialState());

  final ApplyRepository applyRepository;

  static GetApplyCubit get(context) => BlocProvider.of(context);

  ApplyModel? applyModel;

  Future<void> getApply({required String userId}) async {
    emit(GetApplyLoadingState());
    Either<Failure, ApplyModel> result;
    result = await applyRepository.getApply(userId: userId);
    result.fold((failure) {
      emit(GetApplyFailureState(failure.error));
    }, (applyModel) {
      this.applyModel = applyModel;
      emit(GetApplySuccessState(applyModel));
    });
  }
}

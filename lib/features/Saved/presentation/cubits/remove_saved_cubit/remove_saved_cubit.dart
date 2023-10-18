import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/Saved/data/models/delete_saved_model/delete_saved_model.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository.dart';
import 'package:jobhub/features/Saved/presentation/cubits/remove_saved_cubit/remove_saved_state.dart';

class RemoveFromSavedCubit extends Cubit<RemoveFromSavedState> {
  RemoveFromSavedCubit(this.savedRepository)
      : super(RemoveFromSavedInitialState());

  static RemoveFromSavedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final SavedRepository savedRepository;

  Future<void> removeFromSaved({required String jobId}) async {
    emit(RemoveFromSavedLoadingState());
    Either<Failure, DeleteSavedModel> result;
    result = await savedRepository.removeFromSaved(jobId: jobId);
    result.fold((failure) {
      print(failure.error);
      emit(RemoveFromSavedFailureState(failure.error));
    }, (savedModel) {
      emit(RemoveFromSavedSuccessState(savedModel));
    });
  }
}

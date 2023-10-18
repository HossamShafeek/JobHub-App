import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/Saved/data/models/add_saved_model/add_saved_model.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository.dart';
import 'package:jobhub/features/Saved/presentation/cubits/add_saved_cubit/add_saved_state.dart';

class AddToSavedCubit extends Cubit<AddToSavedState> {
  AddToSavedCubit(this.savedRepository) : super(AddToSavedInitialState());

  static AddToSavedCubit get(BuildContext context) => BlocProvider.of(context);

  final SavedRepository savedRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  Future<void> addToSaved({required String jobId}) async {
    emit(AddToSavedLoadingState());
    Either<Failure, AddSavedModel> result;
    result = await savedRepository.addToSaved(jobId: jobId);
    result.fold((failure) {
      print(failure.error);
      emit(AddToSavedFailureState(failure.error));
    }, (addSavedModel) {
      emit(AddToSavedSuccessState(addSavedModel));
    });
  }
}

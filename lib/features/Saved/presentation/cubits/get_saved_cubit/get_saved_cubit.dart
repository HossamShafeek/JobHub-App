import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/Saved/data/models/get_saved_model/get_saved_model.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_state.dart';

class GetSavedCubit extends Cubit<GetSavedState> {
  GetSavedCubit(
    this.savedRepository,
  ) : super(GetSavedInitialState());

  static GetSavedCubit get(BuildContext context) => BlocProvider.of(context);
  final SavedRepository savedRepository;

  GetSavedModel? savedModel;

  List<int> savedId = [];
  bool? status;

  Future<void> getSaved() async {
    emit(GetSavedLoadingState());
    Either<Failure, GetSavedModel> result;
    result = await savedRepository.getSaved();
    result.fold((failure) {
      emit(GetSavedFailureState(failure.error));
    }, (savedModel) {
      status = savedModel.status!;
      this.savedModel = savedModel;
      if (savedModel.data!.isNotEmpty) {
        savedModel.data!.map((savedModel) {
          if (!savedId.contains(savedModel.jobId)) {
            savedId.add(savedModel.jobId!);
          }
        }).toList();
      }
      emit(GetSavedSuccessState(savedModel));
    });
  }
}

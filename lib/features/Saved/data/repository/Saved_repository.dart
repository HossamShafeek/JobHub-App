import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/Saved/data/models/add_saved_model/add_saved_model.dart';
import 'package:jobhub/features/Saved/data/models/delete_saved_model/delete_saved_model.dart';
import 'package:jobhub/features/Saved/data/models/get_saved_model/get_saved_model.dart';

abstract class SavedRepository {
  Future<Either<Failure, GetSavedModel>> getSaved();
  Future<Either<Failure, AddSavedModel>> addToSaved({required String jobId});
  Future<Either<Failure, DeleteSavedModel>> removeFromSaved(
      {required String jobId});
}

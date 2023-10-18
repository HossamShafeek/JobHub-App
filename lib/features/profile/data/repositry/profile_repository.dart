import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/profile/data/models/profile_model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
  Future<Either<Failure, ProfileModel>> updateUserName({
    required String name,
  });
  Future<Either<Failure, ProfileModel>> updatePassword({
    required String password,
  });
}

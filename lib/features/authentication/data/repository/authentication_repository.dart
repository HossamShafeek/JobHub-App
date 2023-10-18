import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/authentication/data/models/authentication_model/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationModel>> userRegister({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  });
}

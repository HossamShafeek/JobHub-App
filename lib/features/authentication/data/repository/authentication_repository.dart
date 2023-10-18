import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:jobhub/features/authentication/data/models/register_model/register_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, RegisterModel>> userRegister({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  });
}

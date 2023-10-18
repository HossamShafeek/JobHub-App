import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:jobhub/features/authentication/data/models/register_model/register_model.dart';
import 'package:jobhub/features/authentication/data/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  final ApiServices apiServices;

  AuthenticationRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, RegisterModel>> userRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Response data =
          await apiServices.post(endPoint: EndPoints.register, data: {
        'name': name,
        'email': email,
        'password': password,
      });

      return Right(RegisterModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['massage'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      print(data.toString());
      return Right(AuthenticationModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['massage'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

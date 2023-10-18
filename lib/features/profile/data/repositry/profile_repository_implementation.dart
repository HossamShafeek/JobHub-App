import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/profile/data/models/profile_model/profile_model.dart';
import 'package:jobhub/features/profile/data/repositry/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ApiServices apiServices;

  ProfileRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getUserProfile,
        token: AppConstants.token,
      );
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updatePassword(
      {required String password}) async {
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.updateUserProfile,
          token: AppConstants.token,
          data: {
            'password': password,
          });
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updateUserName(
      {required String name}) async {
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.updateUserProfile,
          token: AppConstants.token,
          data: {
            'name': name,
          });
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

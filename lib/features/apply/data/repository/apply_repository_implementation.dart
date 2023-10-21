import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply_model.dart';
import 'package:jobhub/features/apply/data/repository/apply_repository.dart';

class ApplyRepositoryImplementation extends ApplyRepository {
  final ApiServices apiServices;

  ApplyRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, Apply>> applyJob({
    required String name,
    required String email,
    required String phone,
    required String workType,
    required dynamic  otherFile,
    required String jobId,
    required String userId,
  }) async {
    try {
      Response data = await apiServices.post(data: {
        'name': name,
        'email': email,
        'mobile': phone,
        'work_type': workType,
        'other_file': await otherFile,
        'jobs_id': jobId,
        'user_id': userId
      }, endPoint: EndPoints.apply, token: AppConstants.token);
      return Right(Apply.fromJson(data.data['data']));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ApplyModel>> getApply({required String userId}) async {
    try {
      Response data = await apiServices.get(
        endPoint: '${EndPoints.apply}/$userId',
        token: AppConstants.token,
      );
      return Right(ApplyModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/data/models/jobs_model/jobs_model.dart';
import 'package:jobhub/features/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, JobsModel>> getRecentlyJobs() async {
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.getRecentlyJobs, token: AppConstants.token);
      return Right(JobsModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Job>> getSuggestedJob() async {
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.getSuggestedJob, token: AppConstants.token);
      return Right(Job.fromJson(data.data['data']));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

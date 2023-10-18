import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/Saved/data/models/add_saved_model/add_saved_model.dart';
import 'package:jobhub/features/Saved/data/models/delete_saved_model/delete_saved_model.dart';
import 'package:jobhub/features/Saved/data/models/get_saved_model/get_saved_model.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository.dart';

class SavedRepositoryImplementation extends SavedRepository {
  final ApiServices apiServices;

  SavedRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, GetSavedModel>> getSaved() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.savedJobs,
        token: AppConstants.token,
      );
      return Right(GetSavedModel.fromJson(data.data));
    } catch (error) {
      print(error.toString());
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['status'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddSavedModel>> addToSaved(
      {required String jobId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.savedJobs,
        token: AppConstants.token,
        data: {
          'job_id': jobId,
        },
      );
      return Right(AddSavedModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['status'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, DeleteSavedModel>> removeFromSaved(
      {required String jobId}) async {
    try {
      Response data = await apiServices.delete(
        endPoint: EndPoints.removeFromSaved + jobId,
        token: AppConstants.token,
      );
      return Right(DeleteSavedModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

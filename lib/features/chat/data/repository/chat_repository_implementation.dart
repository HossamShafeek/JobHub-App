import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/api/api_services.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';
import 'package:jobhub/features/chat/data/models/send_message_model/send_message_model.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository.dart';

class ChatRepositoryImplementation extends ChatRepository {
  final ApiServices apiServices;

  ChatRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, ChatModel>> getChat({
    required String userId,
    required String companyId,
  }) async {
    try {
      Response data = await apiServices.get(
          endPoint: EndPoints.getChat,
          token: AppConstants.token,
          queryParameters: {
            'user_id': userId,
            'comp_id': companyId,
          });
      return Right(ChatModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SendMessageModel>> sendMessageFromCompany({
    required String userId,
    required String companyId,
    required String message,
  }) async {
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.sendMessageFromCompany,
          token: AppConstants.token,
          data: {
            'user_id': userId,
            'comp_id': companyId,
            'massage': message,
          });
      return Right(SendMessageModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SendMessageModel>> sendMessageFromUser({
    required String userId,
    required String companyId,
    required String message,
  }) async {
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.sendMessageFromUser,
          token: AppConstants.token,
          data: {
            'user_id': userId,
            'comp_id': companyId,
            'massage': message,
          });
      return Right(SendMessageModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

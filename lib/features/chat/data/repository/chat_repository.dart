import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';
import 'package:jobhub/features/chat/data/models/send_message_model/send_message_model.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatModel>> getChat({
    required String userId,
    required String companyId,
  });

  Future<Either<Failure, SendMessageModel>> sendMessageFromUser({
    required String userId,
    required String companyId,
    required String message,
  });

  Future<Either<Failure, SendMessageModel>> sendMessageFromCompany({
    required String userId,
    required String companyId,
    required String message,
  });
}

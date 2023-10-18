import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/chat/data/models/send_message_model/send_message_model.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(this.chatRepository) : super(SendMessageInitialState());

  final ChatRepository chatRepository;

  static SendMessageCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController sendMessageController = TextEditingController();

  Future<void> sendMessageFromCompany({
    required String userId,
  }) async {
    emit(SendMessageFormCompanyLoadingState());
    Either<Failure, SendMessageModel> result =
        await chatRepository.sendMessageFromCompany(
      userId: userId,
      companyId: '2',
      message: 'We will review your request',
    );
    result.fold((failure) {
      emit(SendMessageFormCompanyFailureState(failure.error));
    }, (chatModel) {
      emit(SendMessageFormCompanySuccessState(chatModel));
    });
  }

  Future<void> sendMessageFromUser({
    required String userId,
  }) async {
    emit(SendMessageFormUserLoadingState());
    Either<Failure, SendMessageModel> result =
        await chatRepository.sendMessageFromUser(
      userId: userId,
      companyId: '2',
      message: sendMessageController.text,
    );
    result.fold((failure) {
      emit(SendMessageFormUserFailureState(failure.error));
    }, (chatModel) {
      emit(SendMessageFormUserSuccessState(chatModel));
    });
  }
}

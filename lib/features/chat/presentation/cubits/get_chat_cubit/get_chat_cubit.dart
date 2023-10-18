import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_state.dart';

class GetChatCubit extends Cubit<GetChatState> {
  GetChatCubit(this.chatRepository) : super(GetChatInitialState());

  final ChatRepository chatRepository;

  static GetChatCubit get(BuildContext context) => BlocProvider.of(context);

  ScrollController scrollController = ScrollController();
  void jumpToEnd() {
    scrollController.position.jumpTo(scrollController.position.maxScrollExtent);
  }

  ChatModel? chatModel;

  Future<void> getChat({required String userId}) async {
    emit(GetChatLoadingState());
    Either<Failure, ChatModel> result = await chatRepository.getChat(
      userId: userId,
      companyId: '2',
    );
    result.fold((failure) {
      emit(GetChatFailureState(failure.error));
    }, (chatModel) {
      this.chatModel = chatModel;
      emit(GetChatSuccessState(chatModel));
    });
  }
}

import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';

abstract class GetChatState {}

class GetChatInitialState extends GetChatState {}

class GetChatLoadingState extends GetChatState {}

class GetChatSuccessState extends GetChatState {
  final ChatModel chatModel;

  GetChatSuccessState(this.chatModel);
}

class GetChatFailureState extends GetChatState {
  final String error;

  GetChatFailureState(this.error);
}

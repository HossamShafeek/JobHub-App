import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';
import 'package:jobhub/features/chat/data/models/send_message_model/send_message_model.dart';

abstract class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageFormUserLoadingState extends SendMessageState {}

class SendMessageFormUserSuccessState extends SendMessageState {
  final SendMessageModel sendMessageModel;
  SendMessageFormUserSuccessState(this.sendMessageModel);
}

class SendMessageFormUserFailureState extends SendMessageState {
  final String error;
  SendMessageFormUserFailureState(this.error);
}

class SendMessageFormCompanyLoadingState extends SendMessageState {}

class SendMessageFormCompanySuccessState extends SendMessageState {
  final SendMessageModel sendMessageModel;
  SendMessageFormCompanySuccessState(this.sendMessageModel);
}

class SendMessageFormCompanyFailureState extends SendMessageState {
  final String error;
  SendMessageFormCompanyFailureState(this.error);
}

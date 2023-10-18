import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/widgets/custom_back_button.dart';
import 'package:jobhub/core/widgets/logo_widget.dart';
import 'package:jobhub/features/chat/presentation/views/widgets/chat_list_view.dart';
import 'package:jobhub/features/chat/presentation/views/widgets/send_message_text_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const LogoWidget(),
      ),
      body: const AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: Column(
          children: [
            Expanded(child: ChatListView()),
            SendMessageTextField(),
          ],
        ),
      ),
    );
  }
}

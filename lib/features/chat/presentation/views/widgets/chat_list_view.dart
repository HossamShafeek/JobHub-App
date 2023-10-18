import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/widgets/custom_empty_widget.dart';
import 'package:jobhub/features/chat/data/models/chat_model/chat_model.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_state.dart';
import 'package:jobhub/features/chat/presentation/views/widgets/chat_list_view_item.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (GetChatCubit.get(context).chatModel!.data!.isNotEmpty) {
        GetChatCubit.get(context).jumpToEnd();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetChatCubit, GetChatState>(
      builder: (context, state) {
        ChatModel chatModel = GetChatCubit.get(context).chatModel!;
        if (chatModel.data!.isNotEmpty) {
          return ListView.separated(
            controller: GetChatCubit.get(context).scrollController,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatListViewItem(
                chatModel: chatModel.data![chatModel.data!.length - index - 1],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: chatModel.data!.length,
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.chat,
            firstMessage: AppStrings.firstEmptyChatMessage,
            secondMessage: AppStrings.secondEmptyChatMessage,
          );
        }
      },
    );
  }
}

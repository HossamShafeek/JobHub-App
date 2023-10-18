import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_state.dart';

class SendMessageTextField extends StatelessWidget {
  const SendMessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            bottom: AppConstants.padding5w,
            left: AppConstants.padding5w,
            right: AppConstants.padding5w,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller:
                      SendMessageCubit.get(context).sendMessageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.grey50,
                    hintText: 'Type your message...',
                    hintStyle: AppStyles.textStyle14,
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      onTap: () {
                        if (SendMessageCubit.get(context)
                            .sendMessageController
                            .text
                            .isNotEmpty) {
                          SendMessageCubit.get(context)
                              .sendMessageFromUser(
                            userId: AppConstants.userId,
                          )
                              .then((value) {
                            GetChatCubit.get(context).getChat(
                              userId: AppConstants.userId,
                            );
                          });
                          SendMessageCubit.get(context)
                              .sendMessageController
                              .text = '';
                          GetChatCubit.get(context).jumpToEnd();
                        }
                      },
                      child: Container(
                        color: AppColors.primary,
                        child: Icon(
                          IconBroken.Send,
                          color: AppColors.white,
                          size: AppConstants.iconSize24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

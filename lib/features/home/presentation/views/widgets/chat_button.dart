import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_state.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetChatCubit,GetChatState>(builder: (context, state) {
      if(state is GetChatSuccessState){
        return IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.chatView);
          },
          icon: Icon(
            IconBroken.Chat,
            color: AppColors.black,
            size: AppConstants.iconSize28,
          ),
        );
      }else{
        return Padding(
          padding:  EdgeInsets.only(right:AppConstants.defaultPadding),
          child: const ShimmerCircleAvatarEffect(
          ),
        );
      }
    },);
  }
}

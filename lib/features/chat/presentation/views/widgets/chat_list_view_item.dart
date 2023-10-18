import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/chat/data/models/chat_model/datum.dart';

class ChatListViewItem extends StatelessWidget {
  const ChatListViewItem({Key? key, required this.chatModel}) : super(key: key);

  final Datum chatModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatModel.senderUser == 'company'
          ? Alignment.centerLeft
          : Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: chatModel.senderUser == 'company'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.padding10h,
              horizontal: AppConstants.padding10w,
            ),
            decoration: BoxDecoration(
                color: chatModel.senderUser == 'company'
                    ? AppColors.grey50
                    : AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppConstants.radius10r),
                  bottomRight: Radius.circular(AppConstants.radius10r),
                  topRight: chatModel.senderUser == 'company'
                      ? Radius.circular(AppConstants.radius10r)
                      : const Radius.circular(0),
                  topLeft: chatModel.senderUser == 'company'
                      ? const Radius.circular(0)
                      : Radius.circular(AppConstants.radius10r),
                )),
            child: Text(
              chatModel.massage!,
              style: AppStyles.textStyle16.copyWith(
                height: 1.4,
                color: chatModel.senderUser == 'company'
                    ? AppColors.black
                    : AppColors.white,
              ),
            ),
          ),
          Text(
            DateFormat.jm()
                .format(DateTime.parse(chatModel.createdAt.toString())),
            style: AppStyles.textStyle12,
          ),
        ],
      ),
    );
  }
}

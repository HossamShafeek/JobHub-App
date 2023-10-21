import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/widgets/logo_widget.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/get_suggested_job_cubit/get_suggested_job_cubit.dart';
import 'package:jobhub/features/home/presentation/views/widgets/chat_button.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    GetChatCubit.get(context).getChat(userId: AppConstants.userId);
    GetSuggestedJobCubit.get(context).getGetSuggested();
    GetRecentlyJobsCubit.get(context).getRecentlyJobs();
    GetUserProfileCubit.get(context).getUserProfile();
    GetSavedCubit.get(context).getSaved();
    GetApplyCubit.get(context).getApply(userId: AppConstants.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const LogoWidget(),
            actions:const [
              ChatButton(),
            ],
          ),
          body: BottomNavigationCubit.get(context)
              .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              BottomNavigationCubit.get(context).changeBottomNavigation(index);
            },
            currentIndex: BottomNavigationCubit.get(context).currentIndex,
            items: BottomNavigationCubit.get(context).bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}

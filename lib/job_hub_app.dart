import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/config/themes/app_theme.dart';
import 'package:jobhub/core/utils/service_locator.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository_implementation.dart';
import 'package:jobhub/features/Saved/presentation/cubits/add_saved_cubit/add_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository_implementation.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:jobhub/features/home/data/repository/home_repository_implementation.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_cubit.dart';
import 'package:jobhub/features/profile/data/repositry/profile_repository_implementation.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';

class JobHubApp extends StatelessWidget {
  const JobHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetUserProfileCubit(
                  getIt.get<ProfileRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) =>
                  GetChatCubit(getIt.get<ChatRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) => GetRecentlyJobsCubit(
                  getIt.get<HomeRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) =>
                  AddToSavedCubit(getIt.get<SavedRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) =>
                  GetSavedCubit(getIt.get<SavedRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) =>
                  SendMessageCubit(getIt.get<ChatRepositoryImplementation>()),
            ),
          ],
          child: MaterialApp(
            title: 'JobHub',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
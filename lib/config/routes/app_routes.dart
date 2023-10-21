import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/animations/page_fade_transition.dart';
import 'package:jobhub/core/animations/page_slide_transition.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/service_locator.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository_implementation.dart';
import 'package:jobhub/features/Saved/presentation/cubits/remove_saved_cubit/remove_saved_cubit.dart';
import 'package:jobhub/features/apply/data/repository/apply_repository_implementation.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_cubit.dart';
import 'package:jobhub/features/apply/presentation/views/apply_job_view.dart';
import 'package:jobhub/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:jobhub/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:jobhub/features/authentication/presentation/views/login_view.dart';
import 'package:jobhub/features/authentication/presentation/views/register_view.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository_implementation.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:jobhub/features/chat/presentation/views/chat_view.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/data/repository/home_repository_implementation.dart';
import 'package:jobhub/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/get_suggested_job_cubit/get_suggested_job_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:jobhub/features/home/presentation/views/job_details_view.dart';
import 'package:jobhub/features/home/presentation/views/jobs_view.dart';
import 'package:jobhub/features/home/presentation/views/layout_view.dart';
import 'package:jobhub/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:jobhub/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:jobhub/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layoutView = '/layout_view';
  static const String searchView = '/search_view';
  static const String chatView = '/chat_view';
  static const String jobsView = '/jobs_view';
  static const String jobDetailsView = '/job_details_view';
  static const String applyJob = '/apply_job_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                getIt.get<AuthenticationRepositoryImplementation>()),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => RegisterCubit(
                getIt.get<AuthenticationRepositoryImplementation>()),
            child: const RegisterView(),
          ),
        );
      case Routes.chatView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
              create: (context) => SendMessageCubit(
                  getIt.get<ChatRepositoryImplementation>()),
              child: const ChatView()),
        );
      case Routes.jobsView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
              create: (context) => SearchCubit(), child: const JobsView()),
        );
      case Routes.jobDetailsView:
        final job = settings.arguments as Job;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: JobDetailsView(job: job),
        );
      case Routes.applyJob:
        final job = settings.arguments as Job;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => ApplyJobCubit(
                  getIt.get<ApplyRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) => SendMessageCubit(
                  getIt.get<ChatRepositoryImplementation>()),
            ),
          ], child: ApplyJobView(job: job)),
        );
      case Routes.layoutView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => BottomNavigationCubit(),
            ),
            BlocProvider(
              create: (context) => GetSuggestedJobCubit(
                  getIt.get<HomeRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) => GetApplyCubit(
                  getIt.get<ApplyRepositoryImplementation>()),
            ),
            BlocProvider(
              create: (context) => RemoveFromSavedCubit(
                  getIt.get<SavedRepositoryImplementation>()),
            ),
          ], child: const LayoutView()),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}

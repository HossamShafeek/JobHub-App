import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/features/onboarding/presentation/cubit/onboarding_state.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: AppAssets.search,
      title: 'Find a job, and start building your career from now on',
      body:
          'Explore over 25,924 available job roles and upgrade your operator now.',
    ),
    BoardingModel(
      image: AppAssets.jobs,
      title: 'Hundreds of jobs are waiting for you to join together',
      body:
          'Immediately join us and start applying for the job you are interested in.',
    ),
    BoardingModel(
      image: AppAssets.interview,
      title: 'Get the best choice for the job you\'ve always dreamed of',
      body:
          'The better the skills you have, the greater the good job opportunities for you.',
    ),
  ];

  bool isLast = false;

  void onChangePageView(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
      emit(OnChangePageViewState());
    } else {
      isLast = false;
      emit(OnChangePageViewState());
    }
  }
}

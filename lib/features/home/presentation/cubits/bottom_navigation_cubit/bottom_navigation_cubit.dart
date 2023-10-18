import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/features/Saved/presentation/view/saved_view.dart';
import 'package:jobhub/features/apply/presentation/views/applied_view.dart';
import 'package:jobhub/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:jobhub/features/home/presentation/views/home_view.dart';
import 'package:jobhub/features/profile/presentation/views/profile_view.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  List<Widget> bodyScreens = const [
    HomeView(),
    AppliedView(),
    SavedView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Bag,
      ),
      label: 'Applied',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Bookmark,
      ),
      label: 'Saved',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Profile,
      ),
      label: 'Profile',
    ),
  ];
}

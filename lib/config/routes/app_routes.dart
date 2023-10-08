import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_strings.dart';

class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layoutView = '/layout_view';
  static const String searchView = '/search_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.slashView:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashView(),
      //   );
      // case Routes.onBoardingView:
      //   return PageFadeTransition(
      //     page: BlocProvider(
      //         create: (context) => OnBoardingCubit(),
      //         child: const OnBoardingView()),
      //   );
      // case Routes.loginView:
      //   return PageFadeTransition(
      //     page: BlocProvider(
      //       create: (context) =>
      //           LoginCubit(
      //               AuthenticationRepositoryImplementation(
      //                   ApiServicesImplementation())),
      //       child: const LoginView(),
      //     ),
      //   );
      // case Routes.registerView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: BlocProvider(
      //       create: (context) =>
      //           RegisterCubit(
      //               AuthenticationRepositoryImplementation(
      //                   ApiServicesImplementation())),
      //       child: const RegisterView(),
      //     ),
      //   );
      // case Routes.booksView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: BlocProvider(
      //       create: (context) =>
      //           BooksCubit(
      //               HomeRepositoryImplementation(ApiServicesImplementation())),
      //       child: const BooksView(),
      //     ),
      //   );
      // case Routes.bookDetailsView:
      //   final book = settings.arguments as Product;
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: BookDetailsView(book: book),
      //   );
      // case Routes.profileView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: const ProfileView(),
      //   );
      // case Routes.updateProfileView:
      //   final profileModel = settings.arguments as ProfileModel;
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: BlocProvider(
      //         create: (context) =>
      //         UpdateUserProfileCubit(
      //             ProfileRepositoryImplementation(ApiServicesImplementation())),
      //         child: UpdateProfileView(profileModel: profileModel,)),
      //   );
      // case Routes.favouritesView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: const FavouritesView(),
      //   );
      // case Routes.cartView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: MultiBlocProvider(providers: [
      //       BlocProvider(
      //         create: (context) =>
      //             UpdateCartCubit(
      //               CartRepositoryImplementation(ApiServicesImplementation()),
      //             ),
      //       ),
      //       BlocProvider(
      //         create: (context) =>
      //             RemoveFromCartCubit(
      //               CartRepositoryImplementation(ApiServicesImplementation()),
      //             ),
      //       ),
      //     ], child: const CartView()),
      //   );
      // case Routes.checkoutView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) =>
      //               GetCheckoutDataCubit(
      //                   OrderRepositoryImplementation(
      //                       ApiServicesImplementation())),
      //         ),
      //         BlocProvider(
      //           create: (context) =>
      //               GetGovernoratesCubit(
      //                   OrderRepositoryImplementation(
      //                       ApiServicesImplementation())),
      //         ),
      //         BlocProvider(
      //           create: (context) =>
      //               CreateOrderCubit(
      //                   OrderRepositoryImplementation(
      //                       ApiServicesImplementation())),
      //         ),
      //       ],
      //       child: const CheckoutView(),
      //     ),
      //   );
      // case Routes.layoutView:
      //   return PageSlideTransition(
      //     direction: AxisDirection.left,
      //     page: MultiBlocProvider(providers: [
      //       BlocProvider(
      //         create: (context) => AnimatedDrawerCubit(),
      //       ),
      //       BlocProvider(
      //         create: (context) =>
      //             SlidersCubit(
      //                 HomeRepositoryImplementation(
      //                     ApiServicesImplementation())),
      //       ),
      //       BlocProvider(
      //         create: (context) =>
      //             BestSellerCubit(
      //                 HomeRepositoryImplementation(
      //                     ApiServicesImplementation())),
      //       ),
      //       BlocProvider(
      //         create: (context) =>
      //             CategoriesCubit(
      //                 HomeRepositoryImplementation(
      //                     ApiServicesImplementation())),
      //       ),
      //       BlocProvider(
      //         create: (context) =>
      //             NewArrivalsCubit(
      //                 HomeRepositoryImplementation(
      //                     ApiServicesImplementation())),
      //       ),
      //     ], child: const LayoutView()),
      //   );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) =>
      const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      )),
    );
  }
}

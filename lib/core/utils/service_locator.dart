import 'package:get_it/get_it.dart';
import 'package:jobhub/core/api/api_services_implementation.dart';
import 'package:jobhub/features/Saved/data/repository/Saved_repository_implementation.dart';
import 'package:jobhub/features/apply/data/repository/apply_repository_implementation.dart';
import 'package:jobhub/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:jobhub/features/chat/data/repository/chat_repository_implementation.dart';
import 'package:jobhub/features/home/data/repository/home_repository_implementation.dart';
import 'package:jobhub/features/profile/data/repositry/profile_repository_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServicesImplementation>(
      ApiServicesImplementation());
  getIt.registerSingleton<AuthenticationRepositoryImplementation>(
      AuthenticationRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<ChatRepositoryImplementation>(
      ChatRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<ApplyRepositoryImplementation>(
      ApplyRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<SavedRepositoryImplementation>(
      SavedRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
  getIt.registerSingleton<ProfileRepositoryImplementation>(
      ProfileRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
}
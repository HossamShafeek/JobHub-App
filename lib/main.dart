import 'package:flutter/material.dart';
import 'package:jobhub/config/local/cache_helper.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/service_locator.dart';
import 'package:jobhub/job_hub_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupServiceLocator();
  AppConstants.token = CacheHelper.getString(key: 'token') ?? '';
  AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  runApp(const JobHubApp());
}
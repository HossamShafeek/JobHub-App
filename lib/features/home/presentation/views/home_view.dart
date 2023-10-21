import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/home/presentation/views/widgets/custom_search_button.dart';
import 'package:jobhub/features/home/presentation/views/widgets/welcome_message_widget.dart';
import 'package:jobhub/features/home/presentation/views/widgets/recently_jobs_list_view.dart';
import 'package:jobhub/features/home/presentation/views/widgets/suggested_job_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const BouncingScrollPhysics(),
      child:const  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeMessageWidget(),
          CustomSearchButton(),
          SuggestedJobWidget(),
          RecentlyJobsListView(),
        ],
      ),
    );
  }
}

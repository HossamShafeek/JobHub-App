import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/description_tab_widget.dart';
import 'package:jobhub/features/home/presentation/views/widgets/company_tab_widget.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Expanded(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(
                  AppConstants.radius25r,
                ),
              ),
              height: 35.h,
              child: TabBar(
                splashBorderRadius: BorderRadius.circular(
                  AppConstants.radius25r,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstants.radius25r,
                  ),
                  color: AppColors.primary,
                ),
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.grey,
                tabs: const [
                  Tab(
                    text: 'Description',
                  ),
                  Tab(
                    text: 'Company',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  DescriptionTabWidget(job: job),
                  CompanyTabWidget(job: job),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

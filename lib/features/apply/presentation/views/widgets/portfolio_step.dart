import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_state.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/upload_cv_container.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/uploaded_cv_widget.dart';

class PortfolioStep extends StatelessWidget {
  const PortfolioStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.uploadPortfolio,
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            ApplyJobCubit.get(context).pickedFile == null
                ? const UploadCvContainer()
                : const UploadedCvWidget(),
          ],
        );
      },
    );
  }
}

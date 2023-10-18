import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_state.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/bio_data_step.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/portfolio_step.dart';

class CustomStepperWidget extends StatelessWidget {
  const CustomStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        return Expanded(
          child: CupertinoStepper(
            type: StepperType.horizontal,
            currentStep: ApplyJobCubit.get(context).currentStep,
            steps: [
              Step(
                title: const Text('Bio Data'),
                content: const BioDataStep(),
                isActive: ApplyJobCubit.get(context).currentStep >= 0,
                state: ApplyJobCubit.get(context).currentStep < 1
                    ? StepState.editing
                    : StepState.complete,
              ),
              Step(
                isActive: ApplyJobCubit.get(context).currentStep == 1,
                state: ApplyJobCubit.get(context).currentStep == 1
                    ? StepState.editing
                    : StepState.indexed,
                title: const Text('Portfolio'),
                content: const PortfolioStep(),
              ),
            ],
            controlsBuilder: (context, details) {
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}

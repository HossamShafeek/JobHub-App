import 'package:flutter/material.dart';
import 'package:jobhub/core/widgets/custom_text_field.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';

class BioDataStep extends StatelessWidget {
  const BioDataStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ApplyJobCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            textInputType: TextInputType.name,
            controller: ApplyJobCubit.get(context).nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            title: 'Full Name',
            hintText: 'Enter your full name',
          ),
          CustomTextField(
            textInputType: TextInputType.emailAddress,
            controller: ApplyJobCubit.get(context).emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            title: 'Email',
            hintText: 'Enter your email',
          ),
          CustomTextField(
            textInputType: TextInputType.phone,
            controller: ApplyJobCubit.get(context).phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone';
              }else if(value.length <11){
                return 'The phone must consist of 11 numbers';
              }
              return null;
            },
            title: 'Phone',
            hintText: 'Enter your phone',
            maxLength: 11,
            paddingForBottom: 0,
          ),
        ],
      ),
    );
  }
}

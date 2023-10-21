import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply.dart';
import 'package:jobhub/features/apply/data/repository/apply_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit(this.applyRepository) : super(ApplyJobInitialState());

  final ApplyRepository applyRepository;

  static ApplyJobCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int currentStep = 0;

  void increaseCurrentStep() {
    if (currentStep < 1) {
      currentStep++;
      emit(ChangeCurrentStepperIndexState());
    }
  }

  void decreaseCurrentStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(ChangeCurrentStepperIndexState());
    }
  }

  FilePickerResult? pickedFile;
  File? file;
  String? fileName;

  Future<void> pickFile() async {
    pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    file = File(pickedFile!.files.single.path ?? '');
    fileName = file!.path.split('/').last;
    print('===============');
    print(file!.path);
    emit(PickedFileSuccessState());
  }

  Future<void> applyNow2({
    required String jobTimeType,
    required String jobId,
  }) async {
    emit(ApplyJobLoadingState());
    Either<Failure, Apply> result = await applyRepository.applyJob(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      otherFile: await MultipartFile.fromFile(
        file!.path,
        filename: fileName,
      ),
      userId: AppConstants.userId,
      workType: jobTimeType,
      jobId: jobId,
    );
    result.fold((failure) {
      print('====================');
      print(failure.error.toString());
      emit(ApplyJobFailureState(failure.error));
    }, (apply) {
      ApplyJobSuccessState();
    });
  }

  Future<void> applyNow({
    required String jobTimeType,
    required String jobId,
  }) async {
    Dio dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      // connectTimeout: const Duration(seconds: 10),
      // receiveTimeout: const Duration(seconds: 10),
    ));
    emit(ApplyJobLoadingState());
    try {
      if (pickedFile != null) {
        FormData formData = FormData.fromMap({
          'name': nameController.text,
          'email': emailController.text,
          'mobile': phoneController.text,
          'work_type': jobTimeType,
          'jobs_id': jobId,
          'user_id': AppConstants.userId,
          'other_file': await MultipartFile.fromFile(
            file!.path,
            filename: fileName,
          ),
        });
        dio.options.headers = {
          'Authorization': 'Bearer ${AppConstants.token}',
          'Accept': 'application/json',
        };
        Response response = await dio.post(EndPoints.apply, data: formData,
            onSendProgress: (int send, int total) {
          print('$send $total');
        });
        emit(ApplyJobSuccessState());
      }
    } catch (error) {
      emit(ApplyJobFailureState(error.toString()));
    }
  }
}

// Either<Failure, Apply> result = await applyRepository.applyJob(
// name: nameController.text,
// email: emailController.text,
// phone: phoneController.text,
// otherFile: await MultipartFile.fromFile(
// file!.path,
// filename: fileName,
// contentType: MediaType("image", fileName!.split(".").last),
// ),
// userId: AppConstants.userId,
// workType: jobTimeType,
// jobId: jobId,
// );
// result.fold((failure) {
// emit(ApplyJobFailureState(failure.error));
// }, (apply) {
// ApplyJobSuccessState();
// });

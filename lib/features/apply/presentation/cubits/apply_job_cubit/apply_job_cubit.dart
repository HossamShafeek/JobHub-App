import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobhub/core/api/end_points.dart';
import 'package:jobhub/core/utils/app_constants.dart';
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
            //contentType: MediaType("image", fileName!.split(".").last),
          ),
        });
        dio.options.headers = {
          'Authorization': 'Bearer ${AppConstants.token}',
          //'Accept': 'application/json',
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

//   File? imageData;
//   Future<void> getImage()async{
//     final ImagePicker picker=ImagePicker();
//     XFile? image =await picker.pickImage(source: ImageSource.camera);
//     if(image!=null){
//       var selected=File(image.path);
//       emit(PickedFileSuccessState());
//       imageData=selected;
//       print(imageData!.path);
//       print(imageData!.absolute);
//       print('yes');
//     }else{
//       print('No');
//     }
//   }
//
// applyNow2({required int jobId, required String jobTimeType}) async {
//   try{
//     // open a bytestream
//     var stream =
//     new http.ByteStream(DelegatingStream.typed(imageData!.openRead()));
//     // get file length
//     var length = await imageData!.length();
//     // string to uri
//     var uri = Uri.parse("https://project2.amit-learning.com/api/apply");
//     // create multipart request
//     var request = new http.MultipartRequest("POST", uri);
//     // multipart that takes file
//     var multipartFile = new http.MultipartFile('other_file', stream, length,
//         filename: basename(imageData!.path));
//     // add file to multipart
//     request.headers.addAll({
//       //'Content-Type':'multipart/form-data',
//       'Authorization': 'Bearer ${AppConstants.token}',
//     });
//     request.files.add(multipartFile);
//     request.fields['name'] = nameController.text;
//     request.fields['email'] = emailController.text;
//     request.fields['mobile'] = phoneController.text;
//     request.fields['work_type'] = jobTimeType;
//     request.fields['jobs_id'] = jobId.toString();
//     request.fields['user_id'] = '187';
//     // send
//     var response = await request.send();
//     print(response.statusCode);
//     print('osaamam');
//     emit(ApplyJobSuccessState());
//     // listen for response
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
//   }catch(error){
//     emit(ApplyJobFailureState(error.toString()));
//   }
// }
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

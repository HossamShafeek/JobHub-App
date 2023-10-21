import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply_model.dart';

abstract class ApplyRepository {
  Future<Either<Failure, Apply>> applyJob({
    required String name,
    required String email,
    required String phone,
    required String workType,
    required dynamic otherFile,
    required String jobId,
    required String userId,
  });

  Future<Either<Failure, ApplyModel>> getApply({required String userId});
}

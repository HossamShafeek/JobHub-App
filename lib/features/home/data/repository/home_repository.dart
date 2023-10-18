import 'package:dartz/dartz.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/data/models/jobs_model/jobs_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, JobsModel>> getRecentlyJobs();
  Future<Either<Failure, Job>> getSuggestedJob();
}

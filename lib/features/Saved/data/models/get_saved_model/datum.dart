import 'jobs.dart';

class Datum {
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  Jobs? jobs;

  Datum({
    this.id,
    this.userId,
    this.like,
    this.jobId,
    this.image,
    this.name,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.jobs,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        like: json['like'] as int?,
        jobId: json['job_id'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        location: json['location'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        jobs: json['jobs'] == null
            ? null
            : Jobs.fromJson(json['jobs'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'like': like,
        'job_id': jobId,
        'image': image,
        'name': name,
        'location': location,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'jobs': jobs?.toJson(),
      };
}

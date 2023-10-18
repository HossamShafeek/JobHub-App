class User {
  bool? like;
  String? imageJob;
  String? userName;
  String? location;
  int? userId;
  String? jobId;

  User({
    this.like,
    this.imageJob,
    this.userName,
    this.location,
    this.userId,
    this.jobId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        like: json['like'] as bool?,
        imageJob: json['image_job'] as String?,
        userName: json['user_name'] as String?,
        location: json['location'] as String?,
        userId: json['user_id'] as int?,
        jobId: json['job_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'like': like,
        'image_job': imageJob,
        'user_name': userName,
        'location': location,
        'user_id': userId,
        'job_id': jobId,
      };
}

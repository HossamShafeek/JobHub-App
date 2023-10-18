class Apply {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  dynamic cvFile;
  String? otherFile;
  int? jobsId;
  int? userId;
  int? reviewed;
  dynamic accept;
  DateTime? createdAt;
  DateTime? updatedAt;

  Apply({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.workType,
    this.cvFile,
    this.otherFile,
    this.jobsId,
    this.userId,
    this.reviewed,
    this.accept,
    this.createdAt,
    this.updatedAt,
  });

  factory Apply.fromJson(Map<String, dynamic> json) => Apply(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        workType: json['work_type'] as String?,
        cvFile: json['cv_file'] as dynamic,
        otherFile: json['other_file'] as String?,
        jobsId: json['jobs_id'] as int?,
        userId: json['user_id'] as int?,
        reviewed: json['reviewed'] as int?,
        accept: json['accept'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        'cv_file': cvFile,
        'other_file': otherFile,
        'jobs_id': jobsId,
        'user_id': userId,
        'reviewed': reviewed,
        'accept': accept,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

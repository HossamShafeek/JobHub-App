class Job {
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  DateTime? createdAt;
  DateTime? updatedAt;

  Job({
    this.id,
    this.name,
    this.image,
    this.jobTimeType,
    this.jobType,
    this.jobLevel,
    this.jobDescription,
    this.jobSkill,
    this.compName,
    this.compEmail,
    this.compWebsite,
    this.aboutComp,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.createdAt,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        jobTimeType: json['job_time_type'] as String?,
        jobType: json['job_type'] as String?,
        jobLevel: json['job_level'] as String?,
        jobDescription: json['job_description'] as String?,
        jobSkill: json['job_skill'] as String?,
        compName: json['comp_name'] as String?,
        compEmail: json['comp_email'] as String?,
        compWebsite: json['comp_website'] as String?,
        aboutComp: json['about_comp'] as String?,
        location: json['location'] as String?,
        salary: json['salary'] as String?,
        favorites: json['favorites'] as int?,
        expired: json['expired'] as int?,
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
        'image': image,
        'job_time_type': jobTimeType,
        'job_type': jobType,
        'job_level': jobLevel,
        'job_description': jobDescription,
        'job_skill': jobSkill,
        'comp_name': compName,
        'comp_email': compEmail,
        'comp_website': compWebsite,
        'about_comp': aboutComp,
        'location': location,
        'salary': salary,
        'favorites': favorites,
        'expired': expired,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class Profile {
  int? userId;
  String? name;
  String? email;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Profile({
    this.userId,
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userId: json['user_id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'email': email,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}

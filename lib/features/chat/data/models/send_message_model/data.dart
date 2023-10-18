class Data {
  String? massage;
  String? userId;
  String? compId;
  String? senderUser;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.massage,
    this.userId,
    this.compId,
    this.senderUser,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        massage: json['massage'] as String?,
        userId: json['user_id'] as String?,
        compId: json['comp_id'] as String?,
        senderUser: json['sender_user'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'massage': massage,
        'user_id': userId,
        'comp_id': compId,
        'sender_user': senderUser,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}

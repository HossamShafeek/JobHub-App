class Datum {
  int? id;
  String? massage;
  int? userId;
  int? compId;
  String? senderUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.massage,
    this.userId,
    this.compId,
    this.senderUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        massage: json['massage'] as String?,
        userId: json['user_id'] as int?,
        compId: json['comp_id'] as int?,
        senderUser: json['sender_user'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'massage': massage,
        'user_id': userId,
        'comp_id': compId,
        'sender_user': senderUser,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

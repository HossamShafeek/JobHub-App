class DeleteSavedModel {
  bool? status;
  String? message;

  DeleteSavedModel({this.status, this.message});

  factory DeleteSavedModel.fromJson(Map<String, dynamic> json) {
    return DeleteSavedModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}

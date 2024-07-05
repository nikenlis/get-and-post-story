class AddStroyResponseModel {
  bool? error;
  String? message;

  AddStroyResponseModel({this.error, this.message});

  AddStroyResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }
}
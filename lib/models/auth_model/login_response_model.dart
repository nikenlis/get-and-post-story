class LoginResponseModel {
  bool? error;
  String? message;
  LoginResult? loginResult;

  LoginResponseModel({this.error, this.message, this.loginResult});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    loginResult = json['loginResult'] != null
        ? LoginResult.fromJson(json['loginResult'])
        : null;
  }

}

class LoginResult {
  String? userId;
  String? name;
  String? token;

  LoginResult({this.userId, this.name, this.token});

  LoginResult.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    token = json['token'];
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas2_moa/models/auth_model/login_request_model.dart';
import 'package:tugas2_moa/models/auth_model/login_response_model.dart';
import 'package:tugas2_moa/models/auth_model/register_request_model.dart';
import 'package:tugas2_moa/models/auth_model/register_response_model.dart';
import 'package:tugas2_moa/utils/api_endpoints.dart';


class AuthService {
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    try {
        var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.login);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return LoginResponseModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(RegisterRequestModel model) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.register);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print('register : $json');
        return RegisterResponseModel.fromJson(json);
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}


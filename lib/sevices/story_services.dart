import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tugas2_moa/models/story_model/add_story_model/add_story_response_model.dart';
import 'package:tugas2_moa/models/story_model/get_all_stories_model.dart/get_all_stories_response_model.dart';
import 'package:tugas2_moa/models/story_model/get_detail_story_model.dart/get_detail_story_response.dart';
import 'package:tugas2_moa/utils/api_endpoints.dart';
import 'package:tugas2_moa/storage/cache_manager.dart';

class StoryServices with CacheManager {
  Future<AddStroyResponseModel?> fetchAddNewStory(
      String description, File photo) async {
    final token = getToken();
    try {
      ///header
      var headers = {
        'Authorization': 'Bearer $token',
      };

      ///request
      var request = http.MultipartRequest('POST',
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.story.addStory));

      request.headers.addAll(headers);

      // Menambahkan fields ke dalam permintaan multipart
      request.fields['description'] = description;

      // Menambahkan file gambar ke dalam permintaan multipart
      var stream = http.ByteStream(photo.openRead());
      var length = await photo.length();
      var multipartFile = http.MultipartFile('photo', stream, length,
          filename: photo.path.split('/').last);
      request.files.add(multipartFile);

      // Mengirim permintaan dan menanggapi hasilnya
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print('hasil : $json');
        // await fetchAllStories();
        return AddStroyResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<GetAllStoriesResponseModel?> fetchAllStories() async {
    final token = getToken();
    try {
      ///header
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      ///request
      var request = http.MultipartRequest(
          'GET', Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.story.addStory));

      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.story.getAllStories);

      http.Response response =
          await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('hasil : ${json['listStory']}');
        return GetAllStoriesResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<GetDetailStoriesResponse?> fetchDetailStory(String id) async {
    final token = getToken();
    try {
      ///header
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url =
          Uri.parse('${ApiEndpoints.baseUrl}/stories/$id');

      http.Response response =
          await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('GETDETAIL : ${json['story']}');
        return GetDetailStoriesResponse.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }



}

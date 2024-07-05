class Story {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;


  Story(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      this.createdAt,});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    createdAt = json['createdAt'];
  }
}

class Story2 {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;


  Story2(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      this.createdAt,});
}

class GetAllStoriesResponseModel {
  bool? error;
  String? message;
  List<Story>? listStory;

  GetAllStoriesResponseModel({this.error, this.message, this.listStory});

  GetAllStoriesResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['listStory'] != null) {
      listStory = <Story>[];
      json['listStory'].forEach((v) {
        listStory!.add(Story.fromJson(v));
      });
    }
  }
}

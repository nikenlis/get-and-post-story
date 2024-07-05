class GetDetailStoriesResponse {

  Story3? story;

  GetDetailStoriesResponse({this.story});

  GetDetailStoriesResponse.fromJson(Map<String, dynamic> json) {
    story = json['story'] != null ? Story3.fromJson(json['story']) : null;
  }


}

class Story3 {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;
  double? lat;
  double? lon;

  Story3(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      this.createdAt,
      this.lat,
      this.lon});

  Story3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    createdAt = json['createdAt'];
    lat = json['lat'];
    lon = json['lon'];
  }

}
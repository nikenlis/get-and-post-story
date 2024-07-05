class ApiEndpoints {
  static const String baseUrl = 'https://story-api.dicoding.dev/v1';
  static AuthEndPoints authEndPoints = AuthEndPoints();
  static Story story = Story();
}

class AuthEndPoints {
  final String register = '/register';
  final String login = '/login';
}

class Story {
  final String addStory = '/stories';
  final String getAllStories = '/stories';
}

class GlobalUrl {
  static String baseUrl = 'http://192.168.88.117:8000/api/v1';
  static String get url {
    String url = "https://ratopati.com/jsonapi/get_recent_posts/";
    return url;
  }

  static String get newsUrl {
    String newsUrl = "http://192.168.88.117:8000/api/v1/news/";
    return newsUrl;
  }

  static String get recentpost {
    String newsUrl = "http://192.168.88.117:8000/api/v1/get_recent_news/";
    return newsUrl;
  }

  static String get author {
    String authorUrl = "$baseUrl/author/";
    return authorUrl;
  }
}

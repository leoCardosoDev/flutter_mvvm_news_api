class Constants {
  static String topHeadlineUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=59f3fb9b339c4f1891cbc2316468de81';

  static String headlinesFor(String keyword) =>
      "https://newsapi.org/v2/everything?q=$keyword&apiKey=59f3fb9b339c4f1891cbc2316468de81";
}

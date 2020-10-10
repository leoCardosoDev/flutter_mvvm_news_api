import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_news_api/utils/constants.dart';
import '../models/newsArticle.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlineByKeyword(String keyword) =>
      _helperFetchMethod(Constants.headlinesFor(keyword));

  Future<List<NewsArticle>> fetchTopHeadlines() async =>
      _helperFetchMethod(Constants.topHeadlineUrl);

  Future<List<NewsArticle>> _helperFetchMethod(url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get to news");
    }
  }
}

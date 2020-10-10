import 'package:mvvm_news_api/models/newsArticle.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title;
  String get description => _newsArticle.description;
  String get urlToImage => _newsArticle.urlToImage;
  String get url => _newsArticle.url;
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../viewmodels/newsArticleViewModel.dart';

class NewsArticleDetailPage extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailPage({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
      body: WebView(
        initialUrl: this.article.url,
      ),
    );
  }
}

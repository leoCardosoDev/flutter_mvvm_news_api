import 'package:flutter/material.dart';

import '../../viewmodels/newsArticleViewModel.dart';

class NewList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            this.onSelected(article);
          },
          leading: Container(
            width: mediaQuery.size.width * 0.25,
            height: mediaQuery.size.height * 0.25,
            child: article.urlToImage == null
                ? Image.asset("assets/images/news.png")
                : Image.network(article.urlToImage),
          ),
          title: Text(article.title),
        );
      },
    );
  }
}

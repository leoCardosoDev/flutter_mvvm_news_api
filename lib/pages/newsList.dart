import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/newsArticleListViewModel.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: ListView.builder(
        itemCount: viewModel.articles.length,
        itemBuilder: (context, index) {
          final article = viewModel.articles[index];
          return ListTile(
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
      ),
    );
  }
}

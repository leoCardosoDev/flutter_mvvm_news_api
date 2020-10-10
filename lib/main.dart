import 'package:flutter/material.dart';
import 'package:mvvm_news_api/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

import './pages/newsList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
        child: NewsList(),
      ),
    );
  }
}

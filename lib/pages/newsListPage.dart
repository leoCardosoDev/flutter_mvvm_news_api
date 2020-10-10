import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/newsArticleListViewModel.dart';
import './components/newList.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            onSubmitted: (value) {},
            decoration: InputDecoration(
              labelText: "Buscar notícias",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => _textController.clear(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: NewList(articles: viewModel.articles)),
        ],
      ),
    );
  }
}

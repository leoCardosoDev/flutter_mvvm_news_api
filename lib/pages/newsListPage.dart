import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/newsArticleViewModel.dart';
import '../viewmodels/newsArticleListViewModel.dart';
import './components/newList.dart';
import 'newsArticleDetailsPage.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailPage(article: article)));
  }

  Widget _buildList(
      BuildContext context, NewsArticleListViewModel viewModelList) {
    switch (viewModelList.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
        break;
      case LoadingStatus.empty:
        return Center(child: Text("No result found"));
        break;
      case LoadingStatus.completed:
        return Expanded(
            child: NewList(
          articles: viewModelList.articles,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
        break;
      default:
        return CircularProgressIndicator();
    }
  }

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
            onSubmitted: (value) {
              if (value.isNotEmpty) viewModel.populateSearch(value);
            },
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
          _buildList(context, viewModel),
        ],
      ),
    );
  }
}

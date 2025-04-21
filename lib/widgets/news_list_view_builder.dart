import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/vertical_list_widget.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  List<ArticleModel> articales = [];

  @override
  void initState() {
    super.initState();
    future = NewsServices(dio: Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerticalListWidget(
              articales: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: SizedBox(
                    height: 400,
                    child: Center(child: Text("There an error , Try Again"))));
          } else {
            return SliverToBoxAdapter(
                child: SizedBox(
                    // To centrlized it
                    height: 400,
                    child: Center(child: CircularProgressIndicator())));
          }
        });

    // return isLoading ? SliverToBoxAdapter(child: SizedBox( // To centrlized it
    //   height:400,
    //   child: Center(child: CircularProgressIndicator())))
    //   :
    //   articales.isNotEmpty?
    //    VerticalListWidget(articales: articales,)
    //    : SliverToBoxAdapter(child: SizedBox(
    //   height: 400,
    //   child: Center(child: Text("There an error , Try Again"))));
  }
}

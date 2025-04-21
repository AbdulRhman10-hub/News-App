import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/views/webview_screen.dart';
import 'package:news/widgets/vertical_item_widget.dart';

class VerticalListWidget extends StatelessWidget {
  final List<ArticleModel> articales;

  const VerticalListWidget({super.key, required this.articales});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articales.length,
        (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebviewScreen(url:articales[index].url,);
            }));
          },
          child: VerticalItemWidget(
            articleModel: articales[index],
          ),
        ),
      ),
    );
  }
}

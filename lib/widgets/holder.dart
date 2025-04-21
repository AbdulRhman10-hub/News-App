import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/vertical_item_widget.dart';

class VerticalListWidget extends StatefulWidget {
  const VerticalListWidget({
    super.key,
  });

  @override
  State<VerticalListWidget> createState() => _VerticalListWidgetState();
}

class _VerticalListWidgetState extends State<VerticalListWidget> {
  bool isLoading = true;
  List<ArticleModel> articales = [];
  @override
  void initState() {
    super.initState();
    getGenralNews();
  }

  Future<void> getGenralNews() async {
    articales = await NewsServices(dio: Dio()).getNews(category: "genral");
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? SliverToBoxAdapter(child: SizedBox( // To centrlized it
      height:400,
      child: Center(child: CircularProgressIndicator()))) :
    articales.isNotEmpty?
     Expanded(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: articales.length,
          (context, index) => VerticalItemWidget(
            articleModel: articales[index],
          ),
        ),
      ),
    )
    :  SliverToBoxAdapter(child: SizedBox(
      height: 400,
      child: Center(child: Text("There an error , Try Again"))));
  }
}
// ListView.builder(
//           physics:
//               NeverScrollableScrollPhysics(), // precvent this listView scroll (insider listView)
//           shrinkWrap: true, // rebuild all items again ; because the problem was at unbounded height
//           itemCount: vericalList.length,
//           itemBuilder: (context, index) {
//             return VerticalItemWidget(
//               verticalItemsModel: vericalList[index],
//             );
//           }),

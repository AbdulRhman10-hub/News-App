import 'package:flutter/material.dart';
import 'package:news/widgets/horizontal_list_widget.dart';
import 'package:news/widgets/news_list_view_builder.dart';
import 'package:news/widgets/vertical_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFD9C68E)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HorizontalListWidget()),
            NewsListViewBuilder(category: "general",),
            // SliverToBoxAdapter(child: VerticalListWidget()), if will use the first unpowerfull solution
          ],
        ),
      ),
    );
  }
}

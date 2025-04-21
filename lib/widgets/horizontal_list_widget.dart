import 'package:flutter/material.dart';
import 'package:news/models/item_model.dart';
import 'package:news/widgets/item_widget.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({
    super.key,
  });
      final List<ItemModel> list = const [
      ItemModel("General", "assets/generall.jpeg"),
      ItemModel("Entertainment", "assets/entertaiment.avif"),
      ItemModel("Health", "assets/health.avif"),
      ItemModel("Science", "assets/science.avif"),
      ItemModel("Sports", "assets/sportts.jpeg"),
      ItemModel("Technology", "assets/technology.jpeg"),
      ItemModel("Business", "assets/download.jpg"),
    ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
          return ItemWidget(itemModel: list[index],);
        },
        ),
      ),
    );
  }
}
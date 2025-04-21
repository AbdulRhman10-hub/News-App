import 'package:flutter/material.dart';
import 'package:news/models/item_model.dart';
import 'package:news/views/category_view.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(category: itemModel.text,);
        },),);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(itemModel.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Text(
            itemModel.text,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

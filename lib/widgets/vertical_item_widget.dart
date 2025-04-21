import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';

class VerticalItemWidget extends StatelessWidget {
  const VerticalItemWidget({
    super.key,
     required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: articleModel.image != null && articleModel.image!.isNotEmpty
      ? Image.network(
          articleModel.image!,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
            );
          },
        )
      : Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[300],
          child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
        ),
),

        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          articleModel.subTitle ??'',
          maxLines: 2,
          style: TextStyle(fontSize: 22, color: Color(0XFFC9C9C9)),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

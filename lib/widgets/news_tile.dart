import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: articleModel.image != null
                ? Image.network(
                    articleModel.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/photo_2024-08-24_12-40-44.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
        Text(
          articleModel.title,
          // بقوله اخرك سطرين للتكست
          maxLines: 2,
          //لو معندكش مساحة حطلي تلت نقط اخر التكست
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}

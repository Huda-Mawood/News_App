import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length,
          (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NewsTile(
            articleModel: articles[index],
          ),
        );
      }),
    );
    // return ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   //تاخد مساحة كل الايتم  بتنيهم مرة واحدة
    //   shrinkWrap: true,
    //   itemCount: 10,
    //   itemBuilder: (context, indes) {
    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 22),
    //       child: NewsTile(),
    //     );
    //   },
    // );
  }
}

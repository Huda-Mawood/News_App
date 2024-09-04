import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/views/category_views.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(
            category: category.categoryName.toLowerCase(),
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          height: 120,
          width: 190,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(category.image)),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
              child: Text(
            category.categoryName,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          )),
        ),
      ),
    );
  }
}

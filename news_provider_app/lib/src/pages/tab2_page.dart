import 'package:flutter/material.dart';
import 'package:news_provider_app/src/models/category.dart';
import 'package:news_provider_app/src/services/news_service.dart';
import 'package:news_provider_app/src/theme/app_theme.dart';
import 'package:news_provider_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListCategories(),
            if (!newsService.isLoading)
              Expanded(
                child: ListNews(news: newsService.getArticlesSelectedCategory),
              ),
            if (newsService.isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final name = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5),
                Text('${name[0].toUpperCase()}${name.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (newsService.selectedCategory.toLowerCase() == category.name)
              ? primaryColor
              : Colors.black54,
        ),
        child: Icon(category.icon,
            color: (newsService.selectedCategory.toLowerCase() == category.name)
                ? Colors.black
                : Colors.white,
            size: 20),
      ),
    );
  }
}

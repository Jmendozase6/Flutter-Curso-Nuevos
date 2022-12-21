import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider_app/src/models/category.dart';
import 'package:news_provider_app/src/models/news_models.dart';

const String _urlNews = 'https://newsapi.org/v2';
const String _apiKey = '9fb0f826564741d6baa70755ee32c98b';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>?>? categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles![item.name] = [];
    }
    getArticlesByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    _isLoading = true;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticlesSelectedCategory =>
      categoryArticles![selectedCategory]!;

  getTopHeadlines() async {
    const url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=mx';
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles![category]!.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles![category];
    }

    final url =
        '$_urlNews/top-headlines?apiKey=$_apiKey&country=mx&category=$category';
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles![category]!.addAll(newsResponse.articles);

    _isLoading = false;
    notifyListeners();
  }
}

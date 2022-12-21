import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_provider_app/src/services/news_service.dart';
import 'package:news_provider_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: (headlines.isEmpty)
          ? const Center(child: CupertinoActivityIndicator())
          : ListNews(news: headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

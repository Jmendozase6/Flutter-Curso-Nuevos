import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_provider_app/src/services/news_service.dart';
import 'package:news_provider_app/src/theme/app_theme.dart';
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

    return SafeArea(
      child: Scaffold(
        body: (headlines.isEmpty)
            ? const Center(child: CupertinoActivityIndicator())
            : Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Noticias - México',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(height: 10, color: primaryColor),
                  const SizedBox(height: 10),
                  Expanded(child: ListNews(news: headlines)),
                ],
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

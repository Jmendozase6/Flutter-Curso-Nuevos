import 'package:flutter/material.dart';
import 'package:news_provider_app/src/models/news_models.dart';
import 'package:news_provider_app/src/theme/app_theme.dart';

class ListNews extends StatelessWidget {
  const ListNews({super.key, required this.news});

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return Noticia(noticia: news[index], index: index);
      },
    );
  }
}

class Noticia extends StatelessWidget {
  const Noticia({super.key, required this.noticia, required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _CardTopBar(noticiaSrcName: noticia.source.name, index: index),
        _CardTitle(title: noticia.title),
        _CardImage(image: noticia.urlToImage ?? ''),
        _CardBody(description: noticia.description ?? ''),
        const SizedBox(height: 10),
        const _CardButtons(),
        const SizedBox(height: 5),
        const Divider(),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final String noticiaSrcName;
  final int index;

  const _CardTopBar({
    Key? key,
    required this.noticiaSrcName,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ',
              style: TextStyle(color: appTheme.primaryColor)),
          Text('$noticiaSrcName. '),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/giphy.gif'),
          image: NetworkImage(image),
          imageErrorBuilder: (context, error, stackTrace) =>
              const Image(image: AssetImage('assets/images/no-image.png')),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(description.isNotEmpty ? description : ''),
    );
  }
}

class _CardButtons extends StatelessWidget {
  const _CardButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _ButtonCard(
          icon: Icons.star_border,
          color: Colors.purpleAccent,
        ),
        SizedBox(width: 10),
        _ButtonCard(
          icon: Icons.more,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}

class _ButtonCard extends StatelessWidget {
  const _ButtonCard({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(icon, color: appTheme.secondaryHeaderColor),
    );
  }
}

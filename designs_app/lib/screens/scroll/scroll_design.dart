import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
        colors: [
          Color(0xff77EBCC),
          Color(0xff51C2DD),
        ],
      ),
    );
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            Page1(),
            Page2(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // Background
        Background(),

        // Main content
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textTheme = TextStyle(color: Colors.white, fontSize: 60);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text('11°', style: textTheme),
          const Text('Miércoles', style: textTheme),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: const Color(0xff51C2DD),
      alignment: Alignment.topCenter,
      child: Image.asset('assets/images/scroll-1.png'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff51C2DD),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'Bienvenido',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

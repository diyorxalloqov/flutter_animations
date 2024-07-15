
import 'package:flutter/material.dart';

class HeroAnimations extends StatelessWidget {
  const HeroAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: 'hero-tag',
            child: FlutterLogo(size: 100),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Hero(
          tag: 'hero-tag',
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
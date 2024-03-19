import 'package:flutter/material.dart';
import 'package:flutter_news/views/home/components/random_news.dart';
import 'package:flutter_news/views/home/components/slider_with_dots.dart';
import 'package:flutter_news/views/home/components/top_headlines.dart';
import 'package:iconsax/iconsax.dart';

import '../category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ),
            );
          },
          child: const Icon(Iconsax.category),
        ),
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Flutter ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "News",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Trending News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            SliderWithDots(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Top Headlines",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const TopHeadlines(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Random News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const RandomNewss(),
          ],
        ),
      ),
    );
  }
}

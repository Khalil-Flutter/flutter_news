import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SliderDetailsScreen extends StatelessWidget {
  const SliderDetailsScreen({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
  });

  final String img;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Iconsax.arrow_left5),
        ),
        title: const Text(
          "Trending News",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage(img),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

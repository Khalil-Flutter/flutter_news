import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/config/constant.dart';
import 'package:flutter_news/views/details_screen/slider/slider_details_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWithDots extends StatefulWidget {
  @override
  _SliderWithDotsState createState() => _SliderWithDotsState();
}

class _SliderWithDotsState extends State<SliderWithDots> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: sliderList.length,
          itemBuilder: (context, index, realIndex) {
            final assetImage = sliderList[index]["images"];
            final title = sliderList[index]["title"];
            final desc = sliderList[index]["desc"];
            return buildImage(assetImage!, title!, desc!, index);
          },
          options: CarouselOptions(
            height: 150,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        buildIndicator()
      ],
    );
  }

  Widget buildImage(String assetImage, String title, String desc, int index) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SliderDetailsScreen(
                      img: assetImage, title: title, desc: desc),
                ));
          },
          child: Container(
            width: 250,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(assetImage),
              ),
            ),
          ),
        ),
        Positioned(
          top: 80,
          bottom: 6,
          right: 10,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
          dotWidth: 5,
          dotHeight: 5,
          activeDotColor: Colors.blue,
        ),
        activeIndex: currentIndex,
        count: sliderList.length,
      );
}

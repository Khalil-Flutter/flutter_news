import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen(
      {super.key,
      required this.netImg,
      required this.title,
      required this.name,
      required this.desc,
      required this.author,
      required this.dateTime,
      required this.content});

  final String netImg;
  final String title;
  final String name;
  final String desc;
  final String author;
  final String dateTime;
  final String content;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final format = DateFormat('MMMM dd,yyyy');

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.dateTime);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Iconsax.arrow_left5),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shadowColor: Colors.black,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.netImg),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Author : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: widget.author,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(format.format(dateTime)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(widget.desc),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Content:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(widget.content),
            ],
          ),
        ),
      ),
    );
  }
}

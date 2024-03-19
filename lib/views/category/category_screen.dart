import 'package:flutter/material.dart';
import 'package:flutter_news/model/CategoryNewsModel.dart';
import 'package:flutter_news/services/category/category_news_services.dart';
import 'package:flutter_news/views/details_screen/category/category_details_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../../config/constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String category = "General";

  @override
  Widget build(BuildContext context) {
    CategoryNewsServices categoryNewsServices = CategoryNewsServices();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Iconsax.arrow_left5),
          ),
          title: const Text(
            "Category Screen",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "${categoryList[index]["images"]}",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          category = categoryList[index]["name"].toString();
                          setState(() {});
                        },
                        child: Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black38,
                          ),
                          child: Center(
                            child: Text(
                              "${categoryList[index]["name"]}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder<CategoryNewsModel>(
                future: categoryNewsServices.getCategoryApi(category),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryDetailsScreen(
                                        netImg: snapshot
                                            .data!.articles![index].urlToImage
                                            .toString(),
                                        title: snapshot
                                            .data!.articles![index].title
                                            .toString(),
                                        name: snapshot
                                            .data!.articles![index].source!.name
                                            .toString(),
                                        desc: snapshot
                                            .data!.articles![index].description
                                            .toString(),
                                        author: snapshot
                                            .data!.articles![index].author
                                            .toString(),
                                        dateTime: snapshot
                                            .data!.articles![index].publishedAt
                                            .toString(),
                                        content: snapshot
                                            .data!.articles![index].content
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    height: 80,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data!.articles![index].urlToImage
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      snapshot
                                          .data!.articles![index].source!.name
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

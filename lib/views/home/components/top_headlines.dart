import 'package:flutter/material.dart';
import 'package:flutter_news/services/headlines/top_headline_services.dart';

import '../../../model/TopHeadlinesModel.dart';
import '../../details_screen/headlines/headline_details_screen.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  @override
  Widget build(BuildContext context) {
    TopHeadlinesServices topHeadlinesServices = TopHeadlinesServices();
    return SizedBox(
      width: double.infinity,
      height: 102,
      child: FutureBuilder<TopHeadlinesModel>(
        future: topHeadlinesServices.getTopHeadlinesApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HeadlinesDetailsScreen(
                                netImg: snapshot
                                    .data!.articles![index].urlToImage
                                    .toString(),
                                title: snapshot.data!.articles![index].title
                                    .toString(),
                                name: snapshot
                                    .data!.articles![index].source!.name
                                    .toString(),
                                desc: snapshot
                                    .data!.articles![index].description
                                    .toString(),
                                author: snapshot.data!.articles![index].author
                                    .toString(),
                                dateTime: snapshot
                                    .data!.articles![index].publishedAt
                                    .toString(),
                                content: snapshot.data!.articles![index].content
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data!.articles![index].urlToImage
                                    .toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 200,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 180,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                snapshot.data!.articles![index].title
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                snapshot.data!.articles![index].source!.name
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
    );
  }
}

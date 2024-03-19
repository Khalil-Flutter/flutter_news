import 'package:flutter/material.dart';
import 'package:flutter_news/services/random/random_news_services.dart';

import '../../../model/RandomNews.dart';
import '../../details_screen/random/random_news_details_screen.dart';

class RandomNewss extends StatelessWidget {
  const RandomNewss({super.key});

  @override
  Widget build(BuildContext context) {
    RandomNewsServices randomNewsServices = RandomNewsServices();
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder<RandomNews>(
          future: randomNewsServices.getRandomApi(),
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
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RandomNewsDetailsScreen(
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
                          ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                snapshot.data!.articles![index].title
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                snapshot.data!.articles![index].source!.name
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(color: Colors.blue),
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
    );
  }
}
